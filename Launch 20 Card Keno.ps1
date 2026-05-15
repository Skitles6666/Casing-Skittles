$ErrorActionPreference = "Stop"

$ProjectDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$ProjectFile = Join-Path $ProjectDir "project.godot"
$PackageId = "GodotEngine.GodotEngine"

function Write-Info {
	param([string]$Message)
	Write-Host "[20 Card Keno] $Message"
}

function Test-GodotPath {
	param([string]$Path)
	if ([string]::IsNullOrWhiteSpace($Path)) {
		return $false
	}
	if (-not (Test-Path -LiteralPath $Path -PathType Leaf)) {
		return $false
	}
	$name = [IO.Path]::GetFileName($Path)
	return $name -match "^(godot|Godot).*\.exe$"
}

function Get-ShortcutTarget {
	param([string]$ShortcutPath)
	try {
		$shell = New-Object -ComObject WScript.Shell
		$shortcut = $shell.CreateShortcut($ShortcutPath)
		return $shortcut.TargetPath
	}
	catch {
		return $null
	}
}

function Find-Godot {
	$paths = New-Object System.Collections.Generic.List[string]

	foreach ($envName in @("GODOT", "GODOT4", "GODOT_EXE")) {
		$value = [Environment]::GetEnvironmentVariable($envName)
		if ($value) {
			$paths.Add($value)
		}
	}

	foreach ($commandName in @("godot", "godot4", "godot4.6")) {
		$command = Get-Command $commandName -ErrorAction SilentlyContinue
		if ($command -and $command.Source) {
			$paths.Add($command.Source)
		}
	}

	foreach ($registryPath in @(
		"HKCU:\Software\Microsoft\Windows\CurrentVersion\App Paths\godot.exe",
		"HKLM:\Software\Microsoft\Windows\CurrentVersion\App Paths\godot.exe",
		"HKCU:\Software\Microsoft\Windows\CurrentVersion\App Paths\Godot.exe",
		"HKLM:\Software\Microsoft\Windows\CurrentVersion\App Paths\Godot.exe"
	)) {
		$item = Get-ItemProperty -Path $registryPath -ErrorAction SilentlyContinue
		if ($item -and $item."(default)") {
			$paths.Add($item."(default)")
		}
	}

	foreach ($shortcutRoot in @(
		"$env:APPDATA\Microsoft\Windows\Start Menu\Programs",
		"$env:ProgramData\Microsoft\Windows\Start Menu\Programs"
	)) {
		if (Test-Path -LiteralPath $shortcutRoot) {
			Get-ChildItem -LiteralPath $shortcutRoot -Recurse -Filter "*Godot*.lnk" -ErrorAction SilentlyContinue |
				ForEach-Object {
					$target = Get-ShortcutTarget $_.FullName
					if ($target) {
						$paths.Add($target)
					}
				}
		}
	}

	foreach ($folder in @(
		$ProjectDir,
		"$env:LOCALAPPDATA\Microsoft\WinGet\Packages",
		"$env:LOCALAPPDATA\Programs",
		"$env:ProgramFiles",
		"${env:ProgramFiles(x86)}",
		"$env:USERPROFILE\Downloads",
		"$env:USERPROFILE\Desktop",
		"$env:USERPROFILE\OneDrive\Desktop"
	)) {
		if (Test-Path -LiteralPath $folder) {
			Get-ChildItem -LiteralPath $folder -Recurse -Filter "Godot*.exe" -ErrorAction SilentlyContinue |
				Select-Object -First 12 |
				ForEach-Object { $paths.Add($_.FullName) }
		}
	}

	foreach ($path in $paths | Where-Object { $_ } | Select-Object -Unique) {
		if (Test-GodotPath $path) {
			return $path
		}
	}

	return $null
}

function Install-Godot {
	$winget = Get-Command winget -ErrorAction SilentlyContinue
	if (-not $winget) {
		Write-Info "winget is not available on this PC."
		return $false
	}

	Write-Info "Installing Godot Engine with winget. A Windows installer prompt may appear."
	& winget install --id $PackageId --exact --source winget --accept-package-agreements --accept-source-agreements
	return $LASTEXITCODE -eq 0
}

try {
	if (-not (Test-Path -LiteralPath $ProjectFile -PathType Leaf)) {
		throw "Could not find project.godot at $ProjectFile"
	}

	$godot = Find-Godot
	if (-not $godot) {
		Write-Info "Godot is not installed or could not be found."
		Write-Host ""
		Write-Host "Press I to install Godot Engine 4 from winget, or press any other key to close."
		$key = [Console]::ReadKey($true)
		if ($key.Key -ne "I") {
			exit 1
		}

		if (-not (Install-Godot)) {
			Write-Host ""
			Write-Info "Godot did not install successfully."
			Write-Host "Press any key to close."
			[Console]::ReadKey($true) | Out-Null
			exit 1
		}

		$godot = Find-Godot
	}

	if (-not $godot) {
		throw "Godot was installed, but the launcher still could not find godot.exe."
	}

	Write-Info "Opening project with: $godot"
	Start-Process -FilePath $godot -ArgumentList @("--path", $ProjectDir) -WorkingDirectory $ProjectDir
}
catch {
	Write-Host ""
	Write-Host "Could not launch 20 Card Keno:" -ForegroundColor Red
	Write-Host $_.Exception.Message -ForegroundColor Red
	Write-Host ""
	Write-Host "Press any key to close."
	[Console]::ReadKey($true) | Out-Null
	exit 1
}
