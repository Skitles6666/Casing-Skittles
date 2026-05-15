#!/usr/bin/env python3
"""
Monte Carlo for Temple of Ice math draft.
- Uses paytable/reels from assets/math/temple_of_ice_paytable.json and temple_of_ice_reels.json
- 5x3 layout, 30 paylines (see PAYLINES below; override by editing).
- Features: Ice Goddess expands upward; Logos adjacent (4-way) to any Wild become Wild (propagates until stable).
- Free Spins: trigger when Bonus appears on reels 1/3/5; player pick is sampled by weights; one random reel becomes full Wild each free spin; re-triggers add the same number of spins; 600-spin cap per bonus.
Outputs aggregate RTP stats; adjust spins/seed/line_bet via CLI.
"""

import argparse
import json
import random
from pathlib import Path
from typing import List, Dict, Tuple

ROOT = Path(__file__).resolve().parent
PAYTABLE_PATH = ROOT / "temple_of_ice_paytable.json"
REELS_PATH = ROOT / "temple_of_ice_reels.json"

ROWS = 3
COLS = 5
LINES = 30

# 30-line 5x3 set (0=top,2=bottom). Edit to match production math if different.
PAYLINES: List[List[int]] = [
    [0, 0, 0, 0, 0],
    [1, 1, 1, 1, 1],
    [2, 2, 2, 2, 2],
    [0, 1, 2, 1, 0],
    [2, 1, 0, 1, 2],
    [0, 0, 1, 2, 2],
    [2, 2, 1, 0, 0],
    [0, 1, 1, 1, 0],
    [2, 1, 1, 1, 2],
    [1, 0, 1, 2, 1],
    [1, 2, 1, 0, 1],
    [0, 1, 0, 1, 0],
    [2, 1, 2, 1, 2],
    [0, 0, 0, 1, 2],
    [2, 2, 2, 1, 0],
    [1, 1, 0, 1, 2],
    [1, 1, 2, 1, 0],
    [0, 1, 2, 2, 1],
    [2, 1, 0, 0, 1],
    [0, 2, 1, 0, 2],
    [2, 0, 1, 2, 0],
    [0, 2, 2, 2, 0],
    [2, 0, 0, 0, 2],
    [1, 0, 2, 0, 1],
    [1, 2, 0, 2, 1],
    [1, 1, 1, 0, 0],
    [1, 1, 1, 2, 2],
    [0, 0, 1, 1, 2],
    [2, 2, 1, 1, 0],
    [0, 2, 0, 2, 0],
]

# Map reel symbols -> paytable keys
ALIAS = {
    "W": "ICE_GODDESS",
    "L": "FROZEN_CREST",
    "H1": "DAGGER",
    "H2": "MASK",
    "H3": "CHALICE",
    "H4": "AMULET",
}


def load_tables():
    with open(PAYTABLE_PATH) as f:
        paytable = json.load(f)["symbols"]
    with open(REELS_PATH) as f:
        reels = json.load(f)
    base = reels["base_game"]
    fs = reels["free_spins"]
    # convert to list of lists per reel index
    return paytable, base, fs


def window_from_strip(strip: List[str], rng: random.Random) -> List[str]:
    n = len(strip)
    start = rng.randrange(n)
    return [strip[(start + offset) % n] for offset in range(ROWS)]  # top->bottom


def spin_grid(strips: List[List[str]], rng: random.Random) -> List[List[str]]:
    # grid[row][col]
    grid = [[None for _ in range(COLS)] for _ in range(ROWS)]
    for col in range(COLS):
        window = window_from_strip(strips[col], rng)
        for row in range(ROWS):
            grid[row][col] = window[row]
    return grid


def expand_up(grid: List[List[str]]) -> List[List[str]]:
    g = [row[:] for row in grid]
    for col in range(COLS):
        for row in range(ROWS):
            if g[row][col] == "W":
                for r in range(0, row + 1):
                    g[r][col] = "W"
    return g


def ignite_adjacent(grid: List[List[str]]) -> List[List[str]]:
    g = [row[:] for row in grid]
    dirs = [(1, 0), (-1, 0), (0, 1), (0, -1)]
    changed = True
    while changed:
        changed = False
        for row in range(ROWS):
            for col in range(COLS):
                if g[row][col] == "W":
                    for dr, dc in dirs:
                        rr, cc = row + dr, col + dc
                        if 0 <= rr < ROWS and 0 <= cc < COLS and g[rr][cc] == "L":
                            g[rr][cc] = "W"
                            changed = True
    return g


def has_bonus_trigger(grid: List[List[str]]) -> bool:
    # bonus requires at least one B on reels 1,3,5 (0-indexed 0,2,4)
    for col in (0, 2, 4):
        found = any(grid[row][col] == "B" for row in range(ROWS))
        if not found:
            return False
    return True


def pay_for_line(line: List[int], grid: List[List[str]], paytable: Dict[str, Dict]) -> float:
    best = 0.0
    symbols = list(paytable.keys())
    for sym in symbols:
        table = paytable[sym].get("pays", {})
        count = 0
        for col, row in enumerate(line):
            cell = grid[row][col]
            alias = ALIAS.get(cell, cell)
            if cell == "B":
                break  # scatters don't extend line wins
            if cell == "W" or alias == sym:
                count += 1
            else:
                break
        if count <= 0:
            continue
        payout = table.get(str(count)) or table.get(count)
        if payout:
            best = max(best, float(payout))
    return best


def eval_spin(grid: List[List[str]], paytable: Dict[str, Dict]) -> float:
    total = 0.0
    for line in PAYLINES:
        total += pay_for_line(line, grid, paytable)
    return total


def play_base_spin(strips, paytable, rng: random.Random) -> Tuple[float, bool]:
    grid = spin_grid(strips, rng)
    grid = expand_up(grid)
    grid = ignite_adjacent(grid)
    win = eval_spin(grid, paytable)
    triggered = has_bonus_trigger(grid)
    return win, triggered


def play_free_spin(strips, paytable, rng: random.Random) -> Tuple[float, bool]:
    grid = spin_grid(strips, rng)
    grid = expand_up(grid)
    # guaranteed full-reel wild after spin
    reel_choice = rng.randrange(COLS)
    for row in range(ROWS):
        grid[row][reel_choice] = "W"
    grid = ignite_adjacent(grid)
    win = eval_spin(grid, paytable)
    triggered = has_bonus_trigger(grid)
    return win, triggered


def simulate(spins: int, line_bet: float, seed: int, pick_weights: Tuple[float, float, float]):
    paytable, base_reels, fs_reels = load_tables()
    rng = random.Random(seed)

    base_spins = spins
    total_wager = 0.0
    total_win = 0.0
    base_hits = 0
    bonus_triggers = 0
    fs_spins = 0
    fs_win = 0.0

    pick_options = [(12, 1), (8, 2), (5, 3)]

    for _ in range(base_spins):
        total_wager += line_bet * LINES
        win, triggered = play_base_spin(base_reels, paytable, rng)
        total_win += win * line_bet
        if win > 0:
            base_hits += 1
        if triggered:
            bonus_triggers += 1
            # sample player pick once per bonus
            choice = rng.choices(pick_options, weights=pick_weights, k=1)[0]
            spins_left, multiplier = choice
            granted = spins_left
            session_total_awarded = spins_left
            while spins_left > 0 and session_total_awarded <= 600:
                fs_spins += 1
                win_fs, retrig = play_free_spin(fs_reels, paytable, rng)
                fs_win += win_fs * line_bet * multiplier
                total_win += win_fs * line_bet * multiplier
                spins_left -= 1
                if retrig and session_total_awarded < 600:
                    add = min(choice[0], 600 - session_total_awarded)
                    spins_left += add
                    session_total_awarded += add

    rtp = total_win / total_wager if total_wager else 0
    return {
        "base_spins": base_spins,
        "free_spins": fs_spins,
        "wager": total_wager,
        "win": total_win,
        "rtp": rtp,
        "base_hit_rate": base_hits / base_spins if base_spins else 0,
        "bonus_trigger_rate": bonus_triggers / base_spins if base_spins else 0,
        "avg_bonus_value": (fs_win / bonus_triggers) if bonus_triggers else 0,
        "fs_share": fs_win / total_win if total_win else 0,
    }


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--spins", type=int, default=200_000, help="base spins to simulate")
    parser.add_argument("--line-bet", type=float, default=1.0, help="coins per line")
    parser.add_argument("--seed", type=int, default=1)
    parser.add_argument("--weights", type=float, nargs=3, metavar=("w12","w8","w5"), default=(0.6,0.3,0.1), help="weights for 12@1x, 8@2x, 5@3x")
    args = parser.parse_args()

    stats = simulate(args.spins, args.line_bet, args.seed, tuple(args.weights))
    print(json.dumps(stats, indent=2))


if __name__ == "__main__":
    main()
