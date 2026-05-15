extends Control

const GAME_KENO := "keno"
const GAME_POKER := "poker"
const GAME_BLACKJACK := "blackjack"
const GAME_THREE_CARD := "three_card"
const GAME_PAI_GOW := "pai_gow"
const GAME_BACCARAT := "baccarat"
const GAME_CRAPS := "craps"
const GAME_ROULETTE := "roulette"
const GAME_SLOTS := "slots"
const SHOW_CASINO_GAME_TABS := true
const CARD_COUNT := 20
const NUMBER_MAX := 80
const DRAW_COUNT := 20
const MAX_PICKS_PER_CARD := 10
const RECENT_RUN_LIMIT := 500
const CARD_PANEL_WIDTH := 460
const STATS_PANEL_WIDTH := 560
const NUMBER_PANEL_WIDTH := 960
const CARD_BUTTON_SIZE := Vector2(205, 108)
const NUMBER_BUTTON_SIZE := Vector2(74, 56)
const NUMBER_BUTTON_FONT_SIZE := 16
const CARD_BUTTON_FONT_SIZE := 13
const KENO_BALL_STAGE_HEIGHT := 172
const KENO_BALL_SIZE := 42
const KENO_BALL_SPACING := 8
const KENO_BALL_DIR := "res://assets/keno_balls"
const KENO_BOARD_IMAGE := "res://assets/keno_board.png"
const KENO_BOARD_REFERENCE_SIZE := Vector2(3333.0, 2500.0)
const KENO_BOARD_DISPLAY_SIZE := Vector2(700.0, 525.0)
const KENO_BOARD_COL_EDGES := [
	219.0, 504.0, 782.0, 1060.0, 1338.0,
	1616.0, 1894.0, 2172.0, 2450.0, 2728.0, 2994.0,
]
const KENO_BOARD_ROW_TOPS := [
	119.0, 337.0, 591.0, 847.0,
	1357.0, 1597.0, 1867.0, 2119.0,
]
const KENO_BOARD_ROW_BOTTOMS := [
	332.0, 586.0, 842.0, 1086.0,
	1592.0, 1862.0, 2114.0, 2344.0,
]
const CARD_LABELS := [
	"A", "B", "C", "D", "E",
	"F", "G", "H", "I", "J",
	"K", "L", "M", "N", "O",
	"P", "Q", "R", "S", "T",
]

const CARD_COLORS := [
	Color("#ff0000"), Color("#800000"), Color("#ffb700"), Color("#7d5e00"), Color("#99ff00"),
	Color("#298100"), Color("#00ffb3"), Color("#00627d"), Color("#0048ff"), Color("#190072"),
	Color("#fb00ff"), Color("#cb20ff"), Color("#ff7878"), Color("#863c3c"), Color("#78ff81"),
	Color("#457990"), Color("#964385"), Color("#86ffb0"), Color("#5d3e82"), Color("#49488d"),
]

const PAYOUT_TABLE := {
	1: {1: 3},
	2: {2: 12},
	3: {2: 1, 3: 42},
	4: {2: 1, 3: 8, 4: 100},
	5: {2: 1, 3: 4, 4: 20, 5: 450},
	6: {3: 2, 4: 10, 5: 100, 6: 1600},
	7: {3: 2, 4: 6, 5: 25, 6: 400, 7: 7000},
	8: {3: 1, 4: 4, 5: 15, 6: 50, 7: 1000, 8: 10000},
	9: {4: 3, 5: 8, 6: 30, 7: 200, 8: 4000, 9: 10000},
	10: {0: 2,  4: 2, 5: 5, 6: 20, 7: 80, 8: 500, 9: 5000, 10: 10000},
}
const POKER_HAND_SIZE := 5
const POKER_STARTING_CREDITS := 100.0
const POKER_SUITS := ["S", "H", "D", "C"]
const POKER_RANKS := [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
const POKER_CARD_DIR := "res://cards"
const POKER_CARD_DISPLAY_SIZE := Vector2(230, 345)
const POKER_CARD_ROTATIONS := [-4.0, -1.8, 0.0, 1.8, 4.0]
const POKER_PAYOUTS := {
	"Royal Flush": 250,
	"Straight Flush": 50,
	"Four of a Kind": 25,
	"Full House": 9,
	"Flush": 6,
	"Straight": 4,
	"Three of a Kind": 3,
	"Two Pair": 2,
	"Jacks or Better": 1,
	"Nothing": 0,
}
const BLACKJACK_STARTING_CREDITS := 100.0
const BLACKJACK_CARD_DISPLAY_SIZE := Vector2(150, 225)
const BLACKJACK_CARD_ROTATIONS := [-3.0, -1.2, 0.8, 2.2, 3.4, -2.0, 1.4]
const THREE_CARD_STARTING_CREDITS := 100.0
const THREE_CARD_DISPLAY_SIZE := Vector2(170, 255)
const THREE_CARD_ROTATIONS := [-2.4, 0.0, 2.4]
const THREE_CARD_PAIR_PLUS_PAYOUTS := {
	"Straight Flush": 40,
	"Three of a Kind": 30,
	"Straight": 6,
	"Flush": 3,
	"Pair": 1,
}
const THREE_CARD_ANTE_BONUS := {
	"Straight Flush": 5,
	"Three of a Kind": 4,
	"Straight": 1,
}
const PAI_GOW_STARTING_CREDITS := 200.0
const PAI_GOW_CARD_DISPLAY_SIZE := Vector2(98, 147)
const PAI_GOW_CARD_ROTATIONS := [-5.0, -3.0, -1.0, 1.0, 3.0, 5.0, 0.0]
const BACCARAT_STARTING_CREDITS := 100.0
const BACCARAT_TABLE_IMAGE := "res://tables/baccarat_table.png"
const BACCARAT_CARD_DISPLAY_SIZE := Vector2(150, 225)
const BACCARAT_CARD_ROTATIONS := [-2.0, 2.0, 0.0]
const BACCARAT_BET_OPTIONS := ["Player", "Banker", "Tie"]
const CRAPS_STARTING_CREDITS := 500.0
const CRAPS_TABLE_IMAGE := "res://tables/craps_layout.png"
const CRAPS_TABLE_REFERENCE_SIZE := Vector2(1880.0, 1312.0)
const CRAPS_CHIP_DIR := "res://assets/chips"
const CRAPS_DICE_DIR := "res://assets/dice"
const CRAPS_DICE_ROLL_DIR := "res://assets/dice_roll"
const CRAPS_DICE_FACE_FILES := [
	"dice_0000_Layer-1.png",
	"dice_0001_Layer-2.png",
	"dice_0002_Layer-3.png",
	"dice_0003_Layer-4.png",
	"dice_0004_Layer-5.png",
	"dice_0005_Layer-6.png",
]
const CRAPS_DICE_DISPLAY_SIZE := Vector2(132, 132)
const CRAPS_POINT_NUMBERS := [4, 5, 6, 8, 9, 10]
const CRAPS_HARDWAYS := [4, 6, 8, 10]
const CRAPS_CHIP_DENOMINATIONS := [1, 5, 10, 20, 25, 50, 100, 500, 1000, 5000]
const CRAPS_BET_ZONE_RECTS := {
	"pass": [Rect2(50.0, 190.0, 118.0, 844.0), Rect2(168.0, 1137.0, 1066.0, 123.0)],
	"dont_pass": [Rect2(168.0, 190.0, 119.0, 710.0), Rect2(408.0, 1018.0, 706.0, 116.0)],
	"field": [Rect2(290.0, 665.0, 825.0, 353.0)],
	"big_6_8": [Rect2(168.0, 900.0, 240.0, 237.0)],
	"any_craps": [Rect2(1352.0, 1075.0, 468.0, 183.0)],
	"yo": [Rect2(1590.0, 727.0, 230.0, 170.0)],
	"hard_4": [Rect2(1352.0, 371.0, 238.0, 179.0)],
	"hard_6": [Rect2(1352.0, 551.0, 238.0, 179.0)],
	"hard_8": [Rect2(1590.0, 551.0, 230.0, 179.0)],
	"hard_10": [Rect2(1590.0, 371.0, 230.0, 179.0)],
}
const CRAPS_CHIP_POSITIONS := {
	"pass": Vector2(700.0, 1200.0),
	"dont_pass": Vector2(760.0, 1076.0),
	"field": Vector2(704.0, 825.0),
	"big_6_8": Vector2(288.0, 1018.0),
	"any_craps": Vector2(1588.0, 1168.0),
	"yo": Vector2(1705.0, 812.0),
	"hard_4": Vector2(1470.0, 460.0),
	"hard_6": Vector2(1470.0, 640.0),
	"hard_8": Vector2(1705.0, 640.0),
	"hard_10": Vector2(1705.0, 460.0),
}
const CRAPS_POINT_MARKER_POSITIONS := {
	4: Vector2(582.0, 310.0),
	5: Vector2(703.0, 310.0),
	6: Vector2(825.0, 310.0),
	8: Vector2(944.0, 310.0),
	9: Vector2(1067.0, 310.0),
	10: Vector2(1180.0, 310.0),
}
const ROULETTE_STARTING_CREDITS := 500.0
const ROULETTE_TABLE_IMAGE := "res://tables/roulette_table.webp"
const ROULETTE_RED_NUMBERS := [1, 3, 5, 7, 9, 12, 14, 16, 18, 19, 21, 23, 25, 27, 30, 32, 34, 36]
const ROULETTE_BET_OPTIONS := [
	{"label": "Red pays 1:1", "id": "red", "payout": 1},
	{"label": "Black pays 1:1", "id": "black", "payout": 1},
	{"label": "Odd pays 1:1", "id": "odd", "payout": 1},
	{"label": "Even pays 1:1", "id": "even", "payout": 1},
	{"label": "1 to 18 pays 1:1", "id": "low", "payout": 1},
	{"label": "19 to 36 pays 1:1", "id": "high", "payout": 1},
	{"label": "1st 12 pays 2:1", "id": "first_dozen", "payout": 2},
	{"label": "2nd 12 pays 2:1", "id": "second_dozen", "payout": 2},
	{"label": "3rd 12 pays 2:1", "id": "third_dozen", "payout": 2},
	{"label": "Column 1 pays 2:1", "id": "column_1", "payout": 2},
	{"label": "Column 2 pays 2:1", "id": "column_2", "payout": 2},
	{"label": "Column 3 pays 2:1", "id": "column_3", "payout": 2},
]
const SLOT_SCENE_PATH := "res://assets/slot_machine.tscn"

var current_game := GAME_CRAPS
var selected_card := 0
var card_picks: Array = []
var card_plays := []
var card_wins := []
var card_profit := []
var number_hit_counts := []
var last_draw := []
var reveal_all_card_numbers := false
var rounds_played := 0
var winning_rounds := 0
var losing_rounds := 0
var total_wagered := 0.0
var total_paid := 0.0
var recent_runs: Array = []
var hit_tally: Dictionary = {}

var card_buttons := []
var number_buttons: Dictionary = {}
var bet_spin: SpinBox
var quick_pick_count_spin: SpinBox
var auto_play_button: Button
var auto_play_timer: Timer
var lock_layout_button: Button
var left_split: HSplitContainer
var right_split: HSplitContainer
var selected_label: Label
var last_draw_label: Label
var result_label: Label
var keno_board_control: Control
var keno_ball_stage: Control
var keno_ball_tube: PanelContainer
var keno_ball_spout: PanelContainer
var keno_ball_nodes := []
var keno_ball_tween: Tween
var keno_ball_textures: Dictionary = {}
var keno_ball_animating := false
var stats_label: Label
var hit_tally_label: Label
var recent_runs_label: Label
var hot_label: Label
var cold_label: Label
var suggestion_label: Label
var keno_root: VBoxContainer
var poker_root: VBoxContainer
var pai_gow_root: VBoxContainer
var blackjack_root: VBoxContainer
var three_card_root: VBoxContainer
var baccarat_root: VBoxContainer
var craps_root: VBoxContainer
var roulette_root: VBoxContainer
var slots_root: VBoxContainer
var keno_game_button: Button
var poker_game_button: Button
var pai_gow_game_button: Button
var blackjack_game_button: Button
var three_card_game_button: Button
var baccarat_game_button: Button
var craps_game_button: Button
var roulette_game_button: Button
var slots_game_button: Button
var exit_game_button: Button
var poker_bet_spin: SpinBox
var poker_deal_button: Button
var poker_draw_button: Button
var poker_bankroll_label: Label
var poker_status_label: Label
var poker_tip_label: Label
var poker_result_label: Label
var poker_paytable_label: Label
var poker_card_buttons := []
var poker_card_textures: Dictionary = {}
var poker_deck := []
var poker_cards := []
var poker_hold := []
var poker_credits := POKER_STARTING_CREDITS
var poker_hands_played := 0
var poker_total_wagered := 0.0
var poker_total_paid := 0.0
var poker_waiting_for_draw := false
var blackjack_bet_spin: SpinBox
var blackjack_deal_button: Button
var blackjack_hit_button: Button
var blackjack_stand_button: Button
var blackjack_bankroll_label: Label
var blackjack_status_label: Label
var blackjack_tip_label: Label
var blackjack_result_label: Label
var blackjack_dealer_total_label: Label
var blackjack_player_total_label: Label
var blackjack_dealer_row: HBoxContainer
var blackjack_player_row: HBoxContainer
var blackjack_deck := []
var blackjack_dealer_cards := []
var blackjack_player_cards := []
var blackjack_credits := BLACKJACK_STARTING_CREDITS
var blackjack_current_bet := 0.0
var blackjack_hands_played := 0
var blackjack_total_wagered := 0.0
var blackjack_total_paid := 0.0
var blackjack_in_round := false
var blackjack_round_over := false
var three_card_ante_spin: SpinBox
var three_card_pair_plus_spin: SpinBox
var three_card_deal_button: Button
var three_card_play_button: Button
var three_card_fold_button: Button
var three_card_bankroll_label: Label
var three_card_status_label: Label
var three_card_tip_label: Label
var three_card_result_label: Label
var three_card_dealer_label: Label
var three_card_player_label: Label
var three_card_dealer_row: HBoxContainer
var three_card_player_row: HBoxContainer
var three_card_deck := []
var three_card_dealer_cards := []
var three_card_player_cards := []
var three_card_credits := THREE_CARD_STARTING_CREDITS
var three_card_current_ante := 0.0
var three_card_current_pair_plus := 0.0
var three_card_hands_played := 0
var three_card_total_wagered := 0.0
var three_card_total_paid := 0.0
var three_card_in_round := false
var three_card_reveal_dealer := false
var pai_gow_bet_spin: SpinBox
var pai_gow_deal_button: Button
var pai_gow_house_way_button: Button
var pai_gow_set_button: Button
var pai_gow_bankroll_label: Label
var pai_gow_status_label: Label
var pai_gow_tip_label: Label
var pai_gow_result_label: Label
var pai_gow_player_low_label: Label
var pai_gow_player_high_label: Label
var pai_gow_dealer_low_label: Label
var pai_gow_dealer_high_label: Label
var pai_gow_selection_row: HBoxContainer
var pai_gow_player_low_row: HBoxContainer
var pai_gow_player_high_row: HBoxContainer
var pai_gow_dealer_low_row: HBoxContainer
var pai_gow_dealer_high_row: HBoxContainer
var pai_gow_deck := []
var pai_gow_player_cards := []
var pai_gow_dealer_cards := []
var pai_gow_low_indices := []
var pai_gow_credits := PAI_GOW_STARTING_CREDITS
var pai_gow_current_bet := 0.0
var pai_gow_hands_played := 0
var pai_gow_total_wagered := 0.0
var pai_gow_total_paid := 0.0
var pai_gow_in_round := false
var pai_gow_reveal_dealer := false
var baccarat_bet_spin: SpinBox
var baccarat_bet_option: OptionButton
var baccarat_deal_button: Button
var baccarat_bankroll_label: Label
var baccarat_status_label: Label
var baccarat_tip_label: Label
var baccarat_result_label: Label
var baccarat_player_label: Label
var baccarat_banker_label: Label
var baccarat_player_row: HBoxContainer
var baccarat_banker_row: HBoxContainer
var baccarat_table_texture: TextureRect
var baccarat_deck := []
var baccarat_player_cards := []
var baccarat_banker_cards := []
var baccarat_credits := BACCARAT_STARTING_CREDITS
var baccarat_hands_played := 0
var baccarat_total_wagered := 0.0
var baccarat_total_paid := 0.0
var baccarat_last_bet_side := "Banker"
var craps_bet_spin: SpinBox
var craps_roll_button: Button
var craps_reset_button: Button
var craps_bankroll_label: Label
var craps_status_label: Label
var craps_tip_label: Label
var craps_result_label: Label
var craps_history_label: Label
var craps_bets_label: Label
var craps_point_label: Label
var craps_dice_row: HBoxContainer
var craps_die_one: TextureRect
var craps_die_two: TextureRect
var craps_bet_labels: Dictionary = {}
var craps_point_markers: Dictionary = {}
var craps_table_surface: Control
var craps_table_texture: TextureRect
var craps_chip_layer: Control
var craps_chip_selector_row: HBoxContainer
var craps_chip_selector_buttons: Dictionary = {}
var craps_roll_button_anchor: Control
var craps_chip_textures: Dictionary = {}
var craps_dice_textures: Dictionary = {}
var craps_roll_sequences := []
var craps_bets := {
	"pass": 0.0,
	"dont_pass": 0.0,
	"field": 0.0,
	"big_6_8": 0.0,
	"any_craps": 0.0,
	"yo": 0.0,
	"hard_4": 0.0,
	"hard_6": 0.0,
	"hard_8": 0.0,
	"hard_10": 0.0,
}
var craps_credits := CRAPS_STARTING_CREDITS
var craps_point := 0
var craps_rolls_played := 0
var craps_total_wagered := 0.0
var craps_total_paid := 0.0
var craps_roll_history := []
var craps_last_roll := [1, 1]
var craps_roll_in_progress := false
var craps_selected_chip_value := 10.0
var roulette_bet_spin: SpinBox
var roulette_bet_option: OptionButton
var roulette_spin_button: Button
var roulette_reset_button: Button
var roulette_bankroll_label: Label
var roulette_status_label: Label
var roulette_tip_label: Label
var roulette_result_label: Label
var roulette_history_label: Label
var roulette_table_texture: TextureRect
var roulette_credits := ROULETTE_STARTING_CREDITS
var roulette_spins_played := 0
var roulette_total_wagered := 0.0
var roulette_total_paid := 0.0
var roulette_last_pocket := 0
var roulette_spin_history := []


func _ready() -> void:
	randomize()
	for i in CARD_COUNT:
		card_picks.append([])
		card_plays.append(0)
		card_wins.append(0)
		card_profit.append(0.0)
	for i in NUMBER_MAX + 1:
		number_hit_counts.append(0)

	_load_keno_ball_textures()
	_load_craps_chip_textures()
	_load_craps_dice_textures()
	_load_craps_roll_textures()
	_build_interface()
	_refresh_all()


func _build_interface() -> void:
	var background := ColorRect.new()
	background.color = Color("#151820")
	background.set_anchors_preset(Control.PRESET_FULL_RECT)
	add_child(background)

	var margin := MarginContainer.new()
	margin.set_anchors_preset(Control.PRESET_FULL_RECT)
	margin.add_theme_constant_override("margin_left", 16)
	margin.add_theme_constant_override("margin_top", 16)
	margin.add_theme_constant_override("margin_right", 16)
	margin.add_theme_constant_override("margin_bottom", 16)
	add_child(margin)

	var main := VBoxContainer.new()
	main.add_theme_constant_override("separation", 12)
	margin.add_child(main)

	auto_play_timer = Timer.new()
	auto_play_timer.wait_time = 0.65
	auto_play_timer.one_shot = false
	auto_play_timer.timeout.connect(_on_auto_play_timeout)
	add_child(auto_play_timer)

	if SHOW_CASINO_GAME_TABS:
		_build_game_switcher(main)

	keno_root = VBoxContainer.new()
	keno_root.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	keno_root.size_flags_vertical = Control.SIZE_EXPAND_FILL
	keno_root.add_theme_constant_override("separation", 12)
	keno_root.visible = current_game == GAME_KENO
	main.add_child(keno_root)

	poker_root = VBoxContainer.new()
	poker_root.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	poker_root.size_flags_vertical = Control.SIZE_EXPAND_FILL
	poker_root.add_theme_constant_override("separation", 12)
	poker_root.visible = false
	main.add_child(poker_root)


	pai_gow_root = VBoxContainer.new()
	pai_gow_root.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	pai_gow_root.size_flags_vertical = Control.SIZE_EXPAND_FILL
	pai_gow_root.add_theme_constant_override("separation", 12)
	pai_gow_root.visible = current_game == GAME_PAI_GOW
	main.add_child(pai_gow_root)

	blackjack_root = VBoxContainer.new()
	blackjack_root.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	blackjack_root.size_flags_vertical = Control.SIZE_EXPAND_FILL
	blackjack_root.add_theme_constant_override("separation", 12)
	blackjack_root.visible = false
	main.add_child(blackjack_root)

	three_card_root = VBoxContainer.new()
	three_card_root.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	three_card_root.size_flags_vertical = Control.SIZE_EXPAND_FILL
	three_card_root.add_theme_constant_override("separation", 12)
	three_card_root.visible = false
	main.add_child(three_card_root)

	baccarat_root = VBoxContainer.new()
	baccarat_root.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	baccarat_root.size_flags_vertical = Control.SIZE_EXPAND_FILL
	baccarat_root.add_theme_constant_override("separation", 12)
	baccarat_root.visible = false
	main.add_child(baccarat_root)

	craps_root = VBoxContainer.new()
	craps_root.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	craps_root.size_flags_vertical = Control.SIZE_EXPAND_FILL
	craps_root.add_theme_constant_override("separation", 12)
	craps_root.visible = current_game == GAME_CRAPS
	main.add_child(craps_root)

	roulette_root = VBoxContainer.new()
	roulette_root.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	roulette_root.size_flags_vertical = Control.SIZE_EXPAND_FILL
	roulette_root.add_theme_constant_override("separation", 12)
	roulette_root.visible = current_game == GAME_ROULETTE
	main.add_child(roulette_root)

	slots_root = VBoxContainer.new()
	slots_root.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	slots_root.size_flags_vertical = Control.SIZE_EXPAND_FILL
	slots_root.add_theme_constant_override("separation", 12)
	slots_root.visible = false
	main.add_child(slots_root)


	var top_bar := HBoxContainer.new()
	top_bar.add_theme_constant_override("separation", 10)
	keno_root.add_child(top_bar)

	var title := Label.new()
	title.text = "20 Card Keno"
	title.add_theme_font_size_override("font_size", 28)
	title.add_theme_color_override("font_color", Color("#f6f0df"))
	_apply_text_depth(title)
	top_bar.add_child(title)

	selected_label = Label.new()
	selected_label.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	selected_label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	selected_label.add_theme_font_size_override("font_size", 16)
	selected_label.add_theme_color_override("font_color", Color("#cad1df"))
	_apply_text_depth(selected_label)
	top_bar.add_child(selected_label)

	var bet_label := Label.new()
	bet_label.text = "Bet per card"
	bet_label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	bet_label.add_theme_color_override("font_color", Color("#cad1df"))
	top_bar.add_child(bet_label)

	bet_spin = SpinBox.new()
	bet_spin.min_value = 1.0
	bet_spin.max_value = 1000.0
	bet_spin.step = 1.0
	bet_spin.value = 1.0
	bet_spin.custom_minimum_size = Vector2(110, 40)
	top_bar.add_child(bet_spin)

	var hot_pick_button := Button.new()
	hot_pick_button.text = "Use Hot Picks"
	hot_pick_button.tooltip_text = "Fill the selected card with the most-hit numbers from past draws."
	hot_pick_button.custom_minimum_size = Vector2(130, 40)
	hot_pick_button.pressed.connect(_on_use_hot_picks_pressed)
	_apply_button_text_depth(hot_pick_button)
	top_bar.add_child(hot_pick_button)

	var quick_count_label := Label.new()
	quick_count_label.text = "Quick count"
	quick_count_label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	quick_count_label.add_theme_color_override("font_color", Color("#cad1df"))
	top_bar.add_child(quick_count_label)

	quick_pick_count_spin = SpinBox.new()
	quick_pick_count_spin.min_value = 1.0
	quick_pick_count_spin.max_value = float(MAX_PICKS_PER_CARD)
	quick_pick_count_spin.step = 1.0
	quick_pick_count_spin.value = float(MAX_PICKS_PER_CARD)
	quick_pick_count_spin.custom_minimum_size = Vector2(90, 40)
	quick_pick_count_spin.tooltip_text = "How many numbers Quick Card and Quick Pick All should choose."
	top_bar.add_child(quick_pick_count_spin)

	var quick_pick_card_button := Button.new()
	quick_pick_card_button.text = "Quick Card"
	quick_pick_card_button.tooltip_text = "Randomly fill the selected card with the quick count."
	quick_pick_card_button.custom_minimum_size = Vector2(115, 40)
	quick_pick_card_button.pressed.connect(_on_quick_pick_card_pressed)
	_apply_button_text_depth(quick_pick_card_button)
	top_bar.add_child(quick_pick_card_button)

	var quick_pick_button := Button.new()
	quick_pick_button.text = "Quick Pick All"
	quick_pick_button.tooltip_text = "Randomly fill every card with the quick count."
	quick_pick_button.custom_minimum_size = Vector2(130, 40)
	quick_pick_button.pressed.connect(_on_quick_pick_all_pressed)
	_apply_button_text_depth(quick_pick_button)
	top_bar.add_child(quick_pick_button)

	var play_button := Button.new()
	play_button.text = "Play Round"
	play_button.custom_minimum_size = Vector2(130, 40)
	play_button.pressed.connect(_on_play_pressed)
	_apply_button_text_depth(play_button)
	top_bar.add_child(play_button)

	auto_play_button = Button.new()
	auto_play_button.text = "Auto Play"
	auto_play_button.toggle_mode = true
	auto_play_button.tooltip_text = "Keep playing rounds until pressed again."
	auto_play_button.custom_minimum_size = Vector2(120, 40)
	auto_play_button.toggled.connect(_on_auto_play_toggled)
	_apply_button_text_depth(auto_play_button)
	top_bar.add_child(auto_play_button)
	_refresh_auto_play_button(false)

	lock_layout_button = Button.new()
	lock_layout_button.text = "Lock Layout"
	lock_layout_button.toggle_mode = true
	lock_layout_button.tooltip_text = "Lock or unlock the panel drag handles."
	lock_layout_button.custom_minimum_size = Vector2(120, 40)
	lock_layout_button.toggled.connect(_on_lock_layout_toggled)
	_apply_button_text_depth(lock_layout_button)
	top_bar.add_child(lock_layout_button)

	left_split = HSplitContainer.new()
	left_split.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	left_split.size_flags_vertical = Control.SIZE_EXPAND_FILL
	left_split.dragger_visibility = SplitContainer.DRAGGER_VISIBLE
	keno_root.add_child(left_split)

	right_split = HSplitContainer.new()
	right_split.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	right_split.size_flags_vertical = Control.SIZE_EXPAND_FILL
	right_split.dragger_visibility = SplitContainer.DRAGGER_VISIBLE

	left_split.add_child(_build_card_panel())
	left_split.add_child(right_split)
	right_split.add_child(_build_number_panel())
	right_split.add_child(_build_stats_panel())
	_build_poker_interface()
	_build_pai_gow_interface()
	_build_blackjack_interface()
	_build_three_card_interface()
	_build_baccarat_interface()
	_build_craps_interface()
	_build_roulette_interface()
	_build_slots_interface()
	_refresh_game_switcher()
	_refresh_poker()
	_refresh_pai_gow()
	_refresh_blackjack()
	_refresh_three_card()
	_refresh_baccarat()
	_refresh_craps()
	_refresh_roulette()
	call_deferred("_apply_default_panel_sizes")


func _build_game_switcher(parent: VBoxContainer) -> void:
	var switcher := HBoxContainer.new()
	switcher.add_theme_constant_override("separation", 10)
	parent.add_child(switcher)

	var title := Label.new()
	title.text = "Games"
	title.add_theme_font_size_override("font_size", 26)
	title.add_theme_color_override("font_color", Color("#f6f0df"))
	title.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	_apply_text_depth(title)
	switcher.add_child(title)

	keno_game_button = Button.new()
	keno_game_button.text = "20 Card Keno"
	keno_game_button.toggle_mode = true
	keno_game_button.custom_minimum_size = Vector2(160, 40)
	keno_game_button.pressed.connect(_on_game_selected.bind(GAME_KENO))
	_apply_button_text_depth(keno_game_button)
	switcher.add_child(keno_game_button)

	poker_game_button = Button.new()
	poker_game_button.text = "Poker"
	poker_game_button.toggle_mode = true
	poker_game_button.custom_minimum_size = Vector2(110, 40)
	poker_game_button.pressed.connect(_on_game_selected.bind(GAME_POKER))
	_apply_button_text_depth(poker_game_button)
	switcher.add_child(poker_game_button)

	pai_gow_game_button = Button.new()
	pai_gow_game_button.text = "Pai Gow Poker"
	pai_gow_game_button.toggle_mode = true
	pai_gow_game_button.custom_minimum_size = Vector2(150, 40)
	pai_gow_game_button.pressed.connect(_on_game_selected.bind(GAME_PAI_GOW))
	_apply_button_text_depth(pai_gow_game_button)
	switcher.add_child(pai_gow_game_button)

	blackjack_game_button = Button.new()
	blackjack_game_button.text = "Blackjack"
	blackjack_game_button.toggle_mode = true
	blackjack_game_button.custom_minimum_size = Vector2(130, 40)
	blackjack_game_button.pressed.connect(_on_game_selected.bind(GAME_BLACKJACK))
	_apply_button_text_depth(blackjack_game_button)
	switcher.add_child(blackjack_game_button)

	three_card_game_button = Button.new()
	three_card_game_button.text = "3 Card Poker"
	three_card_game_button.toggle_mode = true
	three_card_game_button.custom_minimum_size = Vector2(145, 40)
	three_card_game_button.pressed.connect(_on_game_selected.bind(GAME_THREE_CARD))
	_apply_button_text_depth(three_card_game_button)
	switcher.add_child(three_card_game_button)

	baccarat_game_button = Button.new()
	baccarat_game_button.text = "Baccarat"
	baccarat_game_button.toggle_mode = true
	baccarat_game_button.custom_minimum_size = Vector2(125, 40)
	baccarat_game_button.pressed.connect(_on_game_selected.bind(GAME_BACCARAT))
	_apply_button_text_depth(baccarat_game_button)
	switcher.add_child(baccarat_game_button)

	craps_game_button = Button.new()
	craps_game_button.text = "Craps"
	craps_game_button.toggle_mode = true
	craps_game_button.custom_minimum_size = Vector2(110, 40)
	craps_game_button.pressed.connect(_on_game_selected.bind(GAME_CRAPS))
	_apply_button_text_depth(craps_game_button)
	switcher.add_child(craps_game_button)

	roulette_game_button = Button.new()
	roulette_game_button.text = "Roulette"
	roulette_game_button.toggle_mode = true
	roulette_game_button.custom_minimum_size = Vector2(125, 40)
	roulette_game_button.pressed.connect(_on_game_selected.bind(GAME_ROULETTE))
	_apply_button_text_depth(roulette_game_button)
	switcher.add_child(roulette_game_button)

	slots_game_button = Button.new()
	slots_game_button.text = "Slots"
	slots_game_button.toggle_mode = true
	slots_game_button.custom_minimum_size = Vector2(105, 40)
	slots_game_button.pressed.connect(_on_game_selected.bind(GAME_SLOTS))
	_apply_button_text_depth(slots_game_button)
	switcher.add_child(slots_game_button)

	var spacer := Control.new()
	spacer.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	switcher.add_child(spacer)

	exit_game_button = Button.new()
	exit_game_button.text = "Exit"
	exit_game_button.custom_minimum_size = Vector2(100, 40)
	exit_game_button.tooltip_text = "Exit the casino hall."
	exit_game_button.pressed.connect(_on_exit_pressed)
	_apply_button_text_depth(exit_game_button)
	switcher.add_child(exit_game_button)
	_apply_exit_tab_style()


func _on_game_selected(game: String) -> void:
	if game == current_game:
		_refresh_game_switcher()
		return

	current_game = game
	if current_game != GAME_KENO and auto_play_timer != null:
		auto_play_timer.stop()
		if auto_play_button != null:
			auto_play_button.set_pressed_no_signal(false)
		_refresh_auto_play_button(false)

	keno_root.visible = current_game == GAME_KENO
	poker_root.visible = current_game == GAME_POKER
	pai_gow_root.visible = current_game == GAME_PAI_GOW
	blackjack_root.visible = current_game == GAME_BLACKJACK
	three_card_root.visible = current_game == GAME_THREE_CARD
	baccarat_root.visible = current_game == GAME_BACCARAT
	craps_root.visible = current_game == GAME_CRAPS
	roulette_root.visible = current_game == GAME_ROULETTE
	slots_root.visible = current_game == GAME_SLOTS
	_refresh_game_switcher()


func _refresh_game_switcher() -> void:
	if keno_game_button == null or poker_game_button == null or pai_gow_game_button == null or blackjack_game_button == null or three_card_game_button == null or baccarat_game_button == null or craps_game_button == null or roulette_game_button == null or slots_game_button == null:
		return

	keno_game_button.set_pressed_no_signal(current_game == GAME_KENO)
	poker_game_button.set_pressed_no_signal(current_game == GAME_POKER)
	pai_gow_game_button.set_pressed_no_signal(current_game == GAME_PAI_GOW)
	blackjack_game_button.set_pressed_no_signal(current_game == GAME_BLACKJACK)
	three_card_game_button.set_pressed_no_signal(current_game == GAME_THREE_CARD)
	baccarat_game_button.set_pressed_no_signal(current_game == GAME_BACCARAT)
	craps_game_button.set_pressed_no_signal(current_game == GAME_CRAPS)
	roulette_game_button.set_pressed_no_signal(current_game == GAME_ROULETTE)
	slots_game_button.set_pressed_no_signal(current_game == GAME_SLOTS)
	_apply_game_tab_style(keno_game_button, current_game == GAME_KENO)
	_apply_game_tab_style(poker_game_button, current_game == GAME_POKER)
	_apply_game_tab_style(pai_gow_game_button, current_game == GAME_PAI_GOW)
	_apply_game_tab_style(blackjack_game_button, current_game == GAME_BLACKJACK)
	_apply_game_tab_style(three_card_game_button, current_game == GAME_THREE_CARD)
	_apply_game_tab_style(baccarat_game_button, current_game == GAME_BACCARAT)
	_apply_game_tab_style(craps_game_button, current_game == GAME_CRAPS)
	_apply_game_tab_style(roulette_game_button, current_game == GAME_ROULETTE)
	_apply_game_tab_style(slots_game_button, current_game == GAME_SLOTS)
	_apply_exit_tab_style()


func _on_exit_pressed() -> void:
	if auto_play_timer != null:
		auto_play_timer.stop()
	get_tree().quit()


func _apply_game_tab_style(button: Button, active: bool) -> void:
	var bg := Color("#336b9d") if active else Color("#2a3038")
	var border := Color("#f6f0df") if active else Color("#3b4450")
	button.add_theme_stylebox_override("normal", _button_style(bg, border, 2 if active else 1))
	button.add_theme_stylebox_override("hover", _button_style(bg.lightened(0.1), Color("#f6f0df"), 2))
	button.add_theme_stylebox_override("pressed", _button_style(bg.darkened(0.08), Color("#ffffff"), 3, true))
	button.add_theme_color_override("font_color", Color("#ffffff"))


func _apply_exit_tab_style() -> void:
	if exit_game_button == null:
		return

	_apply_exit_button_style(exit_game_button)


func _apply_exit_button_style(button: Button) -> void:
	var bg := Color("#8f3535")
	button.add_theme_stylebox_override("normal", _button_style(bg, Color("#5c2424"), 1))
	button.add_theme_stylebox_override("hover", _button_style(bg.lightened(0.12), Color("#f6f0df"), 2))
	button.add_theme_stylebox_override("pressed", _button_style(bg.darkened(0.12), Color("#ffffff"), 3, true))
	button.add_theme_color_override("font_color", Color("#ffffff"))


func _apply_default_panel_sizes() -> void:
	left_split.split_offset = CARD_PANEL_WIDTH
	right_split.split_offset = NUMBER_PANEL_WIDTH


func _on_lock_layout_toggled(locked: bool) -> void:
	var visibility := SplitContainer.DRAGGER_HIDDEN_COLLAPSED if locked else SplitContainer.DRAGGER_VISIBLE
	left_split.dragger_visibility = visibility
	right_split.dragger_visibility = visibility
	lock_layout_button.text = "Unlock Layout" if locked else "Lock Layout"


func _build_card_panel() -> Control:
	var panel := PanelContainer.new()
	panel.custom_minimum_size = Vector2(CARD_PANEL_WIDTH, 0)
	panel.add_theme_stylebox_override("panel", _panel_style(Color("#1e2430")))

	var padding := MarginContainer.new()
	padding.add_theme_constant_override("margin_left", 10)
	padding.add_theme_constant_override("margin_top", 10)
	padding.add_theme_constant_override("margin_right", 10)
	padding.add_theme_constant_override("margin_bottom", 10)
	panel.add_child(padding)

	var layout := VBoxContainer.new()
	layout.add_theme_constant_override("separation", 8)
	padding.add_child(layout)

	var header := HBoxContainer.new()
	layout.add_child(header)

	var label := Label.new()
	label.text = "Cards"
	label.add_theme_font_size_override("font_size", 20)
	label.add_theme_color_override("font_color", Color("#f6f0df"))
	label.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	header.add_child(label)

	var clear_card := Button.new()
	clear_card.text = "Clear Card"
	clear_card.pressed.connect(_on_clear_card_pressed)
	header.add_child(clear_card)

	var clear_all := Button.new()
	clear_all.text = "Clear All"
	clear_all.pressed.connect(_on_clear_all_pressed)
	header.add_child(clear_all)

	var scroll := ScrollContainer.new()
	scroll.size_flags_vertical = Control.SIZE_EXPAND_FILL
	layout.add_child(scroll)

	var grid := GridContainer.new()
	grid.columns = 2
	grid.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	grid.add_theme_constant_override("h_separation", 8)
	grid.add_theme_constant_override("v_separation", 8)
	scroll.add_child(grid)

	for i in CARD_COUNT:
		var button := Button.new()
		button.custom_minimum_size = CARD_BUTTON_SIZE
		button.toggle_mode = true
		button.pressed.connect(_on_card_pressed.bind(i))
		card_buttons.append(button)
		grid.add_child(button)

	return panel


func _build_number_panel() -> Control:
	var panel := PanelContainer.new()
	panel.custom_minimum_size = Vector2(NUMBER_PANEL_WIDTH, 0)
	panel.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	panel.size_flags_vertical = Control.SIZE_EXPAND_FILL
	panel.add_theme_stylebox_override("panel", _panel_style(Color("#20242a")))

	var padding := MarginContainer.new()
	padding.add_theme_constant_override("margin_left", 10)
	padding.add_theme_constant_override("margin_top", 10)
	padding.add_theme_constant_override("margin_right", 10)
	padding.add_theme_constant_override("margin_bottom", 10)
	panel.add_child(padding)

	var layout := VBoxContainer.new()
	layout.add_theme_constant_override("separation", 8)
	padding.add_child(layout)

	keno_ball_stage = Control.new()
	keno_ball_stage.custom_minimum_size = Vector2(0, KENO_BALL_STAGE_HEIGHT)
	keno_ball_stage.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	keno_ball_stage.mouse_filter = Control.MOUSE_FILTER_IGNORE
	keno_ball_stage.z_index = 20
	keno_ball_stage.clip_contents = false
	keno_ball_stage.resized.connect(_layout_keno_ball_tube)
	layout.add_child(keno_ball_stage)

	keno_ball_tube = PanelContainer.new()
	keno_ball_tube.mouse_filter = Control.MOUSE_FILTER_IGNORE
	keno_ball_tube.add_theme_stylebox_override("panel", _keno_tube_style())
	keno_ball_stage.add_child(keno_ball_tube)

	keno_ball_spout = PanelContainer.new()
	keno_ball_spout.mouse_filter = Control.MOUSE_FILTER_IGNORE
	keno_ball_spout.add_theme_stylebox_override("panel", _keno_spout_style())
	keno_ball_stage.add_child(keno_ball_spout)
	call_deferred("_layout_keno_ball_tube")

	last_draw_label = Label.new()
	last_draw_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	last_draw_label.add_theme_color_override("font_color", Color("#f6f0df"))
	layout.add_child(last_draw_label)

	var board_center := CenterContainer.new()
	board_center.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	board_center.size_flags_vertical = Control.SIZE_EXPAND_FILL
	layout.add_child(board_center)

	keno_board_control = Control.new()
	keno_board_control.custom_minimum_size = KENO_BOARD_DISPLAY_SIZE
	keno_board_control.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	keno_board_control.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	keno_board_control.clip_contents = true
	keno_board_control.resized.connect(_layout_keno_board_buttons)
	board_center.add_child(keno_board_control)

	var board_texture := TextureRect.new()
	board_texture.set_anchors_preset(Control.PRESET_FULL_RECT)
	board_texture.mouse_filter = Control.MOUSE_FILTER_IGNORE
	board_texture.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	board_texture.stretch_mode = TextureRect.STRETCH_SCALE
	if ResourceLoader.exists(KENO_BOARD_IMAGE):
		board_texture.texture = load(KENO_BOARD_IMAGE)
	elif FileAccess.file_exists(KENO_BOARD_IMAGE):
		var board_image: Image = Image.load_from_file(KENO_BOARD_IMAGE)
		if board_image != null and not board_image.is_empty():
			board_texture.texture = ImageTexture.create_from_image(board_image)
	keno_board_control.add_child(board_texture)

	for number in range(1, NUMBER_MAX + 1):
		var button := Button.new()
		button.text = ""
		button.focus_mode = Control.FOCUS_NONE
		button.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND
		button.tooltip_text = "Pick number %d for the selected card." % number
		button.pressed.connect(_on_number_pressed.bind(number))
		number_buttons[number] = button
		keno_board_control.add_child(button)
	call_deferred("_layout_keno_board_buttons")

	result_label = Label.new()
	result_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	result_label.add_theme_color_override("font_color", Color("#cad1df"))
	layout.add_child(result_label)

	return panel


func _build_stats_panel() -> Control:
	var panel := PanelContainer.new()
	panel.custom_minimum_size = Vector2(STATS_PANEL_WIDTH, 0)
	panel.add_theme_stylebox_override("panel", _panel_style(Color("#1d2329")))

	var padding := MarginContainer.new()
	padding.add_theme_constant_override("margin_left", 12)
	padding.add_theme_constant_override("margin_top", 10)
	padding.add_theme_constant_override("margin_right", 12)
	padding.add_theme_constant_override("margin_bottom", 10)
	panel.add_child(padding)

	var scroll := ScrollContainer.new()
	scroll.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	scroll.size_flags_vertical = Control.SIZE_EXPAND_FILL
	padding.add_child(scroll)

	var layout := VBoxContainer.new()
	layout.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	layout.add_theme_constant_override("separation", 10)
	scroll.add_child(layout)

	var header := Label.new()
	header.text = "Live Game Data"
	header.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	header.add_theme_font_size_override("font_size", 20)
	header.add_theme_color_override("font_color", Color("#f6f0df"))
	layout.add_child(header)

	var reset_grid := GridContainer.new()
	reset_grid.columns = 2
	reset_grid.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	reset_grid.add_theme_constant_override("h_separation", 6)
	reset_grid.add_theme_constant_override("v_separation", 6)
	layout.add_child(reset_grid)

	reset_grid.add_child(_build_reset_button("Reset All-Time", _on_reset_all_time_pressed))
	reset_grid.add_child(_build_reset_button("Reset Last 100", _on_reset_recent_runs_pressed))
	reset_grid.add_child(_build_reset_button("Reset Hits", _on_reset_number_hits_pressed))
	reset_grid.add_child(_build_reset_button("Reset Card", _on_reset_selected_card_pressed))
	reset_grid.add_child(_build_reset_button("Reset Cards", _on_reset_all_cards_pressed))
	reset_grid.add_child(_build_reset_button("Reset All", _on_reset_all_counters_pressed))

	stats_label = Label.new()
	_configure_stats_wrap_label(stats_label)
	stats_label.add_theme_color_override("font_color", Color("#cad1df"))
	layout.add_child(stats_label)

	hit_tally_label = Label.new()
	_configure_stats_wrap_label(hit_tally_label)
	hit_tally_label.add_theme_color_override("font_color", Color("#c9f3df"))
	layout.add_child(hit_tally_label)

	recent_runs_label = Label.new()
	_configure_stats_wrap_label(recent_runs_label)
	recent_runs_label.add_theme_color_override("font_color", Color("#dfe7f3"))
	layout.add_child(recent_runs_label)

	suggestion_label = Label.new()
	_configure_stats_wrap_label(suggestion_label)
	suggestion_label.add_theme_color_override("font_color", Color("#f5d067"))
	layout.add_child(suggestion_label)

	hot_label = Label.new()
	_configure_stats_wrap_label(hot_label)
	hot_label.add_theme_color_override("font_color", Color("#ffb07a"))
	layout.add_child(hot_label)

	cold_label = Label.new()
	_configure_stats_wrap_label(cold_label)
	cold_label.add_theme_color_override("font_color", Color("#9ad4ff"))
	layout.add_child(cold_label)

	var payout_title := Label.new()
	payout_title.text = "Standard Payout"
	payout_title.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	payout_title.add_theme_font_size_override("font_size", 18)
	payout_title.add_theme_color_override("font_color", Color("#f6f0df"))
	layout.add_child(payout_title)

	var payout_text := RichTextLabel.new()
	payout_text.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	payout_text.fit_content = true
	payout_text.bbcode_enabled = true
	payout_text.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	payout_text.text = _format_payout_table()
	payout_text.add_theme_color_override("default_color", Color("#cad1df"))
	layout.add_child(payout_text)

	return panel


func _build_poker_interface() -> void:
	var top_bar := HBoxContainer.new()
	top_bar.add_theme_constant_override("separation", 10)
	poker_root.add_child(top_bar)

	var title := Label.new()
	title.text = "Poker"
	title.add_theme_font_size_override("font_size", 28)
	title.add_theme_color_override("font_color", Color("#f6f0df"))
	title.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	_apply_text_depth(title)
	top_bar.add_child(title)

	poker_bankroll_label = Label.new()
	poker_bankroll_label.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	poker_bankroll_label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	poker_bankroll_label.add_theme_font_size_override("font_size", 16)
	poker_bankroll_label.add_theme_color_override("font_color", Color("#cad1df"))
	_apply_text_depth(poker_bankroll_label)
	top_bar.add_child(poker_bankroll_label)

	var bet_label := Label.new()
	bet_label.text = "Bet"
	bet_label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	bet_label.add_theme_color_override("font_color", Color("#cad1df"))
	top_bar.add_child(bet_label)

	poker_bet_spin = SpinBox.new()
	poker_bet_spin.min_value = 1.0
	poker_bet_spin.max_value = 100.0
	poker_bet_spin.step = 1.0
	poker_bet_spin.value = 5.0
	poker_bet_spin.custom_minimum_size = Vector2(95, 40)
	top_bar.add_child(poker_bet_spin)

	var reset_button := Button.new()
	reset_button.text = "Reset Credits"
	reset_button.custom_minimum_size = Vector2(135, 40)
	reset_button.pressed.connect(_on_poker_reset_pressed)
	_apply_button_text_depth(reset_button)
	top_bar.add_child(reset_button)

	var body := HSplitContainer.new()
	body.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	body.size_flags_vertical = Control.SIZE_EXPAND_FILL
	body.dragger_visibility = SplitContainer.DRAGGER_VISIBLE
	poker_root.add_child(body)

	body.add_child(_build_poker_table_panel())
	body.add_child(_build_poker_stats_panel())


func _build_poker_table_panel() -> Control:
	var panel := PanelContainer.new()
	panel.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	panel.size_flags_vertical = Control.SIZE_EXPAND_FILL
	panel.add_theme_stylebox_override("panel", _poker_table_style())

	var padding := MarginContainer.new()
	padding.add_theme_constant_override("margin_left", 16)
	padding.add_theme_constant_override("margin_top", 16)
	padding.add_theme_constant_override("margin_right", 16)
	padding.add_theme_constant_override("margin_bottom", 16)
	panel.add_child(padding)

	var layout := VBoxContainer.new()
	layout.add_theme_constant_override("separation", 14)
	padding.add_child(layout)

	poker_status_label = Label.new()
	poker_status_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	poker_status_label.size_flags_vertical = Control.SIZE_SHRINK_BEGIN
	poker_status_label.add_theme_font_size_override("font_size", 18)
	poker_status_label.add_theme_color_override("font_color", Color("#f6f0df"))
	_apply_text_depth(poker_status_label)
	layout.add_child(poker_status_label)

	var card_grid := GridContainer.new()
	card_grid.columns = POKER_HAND_SIZE
	card_grid.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	card_grid.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	card_grid.add_theme_constant_override("h_separation", 18)
	card_grid.add_theme_constant_override("v_separation", 18)
	layout.add_child(card_grid)

	for i in POKER_HAND_SIZE:
		var button := Button.new()
		button.custom_minimum_size = POKER_CARD_DISPLAY_SIZE
		button.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
		button.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		button.expand_icon = true
		button.icon_alignment = HORIZONTAL_ALIGNMENT_CENTER
		button.vertical_icon_alignment = VERTICAL_ALIGNMENT_CENTER
		button.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND
		button.pressed.connect(_on_poker_card_pressed.bind(i))
		_apply_button_text_depth(button)
		poker_card_buttons.append(button)
		card_grid.add_child(button)

	var action_row := HBoxContainer.new()
	action_row.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	action_row.add_theme_constant_override("separation", 18)
	layout.add_child(action_row)

	poker_deal_button = Button.new()
	poker_deal_button.text = "Deal"
	poker_deal_button.custom_minimum_size = Vector2(190, 62)
	poker_deal_button.pressed.connect(_on_poker_deal_pressed)
	poker_deal_button.add_theme_font_size_override("font_size", 22)
	_apply_button_text_depth(poker_deal_button)
	action_row.add_child(poker_deal_button)

	poker_draw_button = Button.new()
	poker_draw_button.text = "Draw"
	poker_draw_button.custom_minimum_size = Vector2(190, 62)
	poker_draw_button.pressed.connect(_on_poker_draw_pressed)
	poker_draw_button.add_theme_font_size_override("font_size", 22)
	_apply_button_text_depth(poker_draw_button)
	action_row.add_child(poker_draw_button)

	poker_tip_label = Label.new()
	poker_tip_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	poker_tip_label.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	poker_tip_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	poker_tip_label.add_theme_font_size_override("font_size", 24)
	poker_tip_label.add_theme_color_override("font_color", Color("#c9f3df"))
	_apply_text_depth(poker_tip_label)
	layout.add_child(poker_tip_label)

	poker_result_label = Label.new()
	poker_result_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	poker_result_label.size_flags_vertical = Control.SIZE_SHRINK_END
	poker_result_label.add_theme_font_size_override("font_size", 20)
	poker_result_label.add_theme_color_override("font_color", Color("#f5d067"))
	_apply_text_depth(poker_result_label)
	layout.add_child(poker_result_label)

	return panel


func _build_poker_stats_panel() -> Control:
	var panel := PanelContainer.new()
	panel.custom_minimum_size = Vector2(410, 0)
	panel.add_theme_stylebox_override("panel", _panel_style(Color("#20242a")))

	var padding := MarginContainer.new()
	padding.add_theme_constant_override("margin_left", 12)
	padding.add_theme_constant_override("margin_top", 12)
	padding.add_theme_constant_override("margin_right", 12)
	padding.add_theme_constant_override("margin_bottom", 12)
	panel.add_child(padding)

	var layout := VBoxContainer.new()
	layout.add_theme_constant_override("separation", 10)
	padding.add_child(layout)

	var title := Label.new()
	title.text = "Jacks or Better"
	title.add_theme_font_size_override("font_size", 20)
	title.add_theme_color_override("font_color", Color("#f6f0df"))
	layout.add_child(title)

	poker_paytable_label = Label.new()
	poker_paytable_label.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	poker_paytable_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	poker_paytable_label.add_theme_color_override("font_color", Color("#cad1df"))
	layout.add_child(poker_paytable_label)

	return panel


func _build_pai_gow_interface() -> void:
	var top_bar := HBoxContainer.new()
	top_bar.add_theme_constant_override("separation", 10)
	pai_gow_root.add_child(top_bar)

	var title := Label.new()
	title.text = "Pai Gow Poker"
	title.add_theme_font_size_override("font_size", 28)
	title.add_theme_color_override("font_color", Color("#f6f0df"))
	title.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	_apply_text_depth(title)
	top_bar.add_child(title)

	pai_gow_bankroll_label = Label.new()
	pai_gow_bankroll_label.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	pai_gow_bankroll_label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	pai_gow_bankroll_label.add_theme_font_size_override("font_size", 16)
	pai_gow_bankroll_label.add_theme_color_override("font_color", Color("#cad1df"))
	_apply_text_depth(pai_gow_bankroll_label)
	top_bar.add_child(pai_gow_bankroll_label)

	var bet_label := Label.new()
	bet_label.text = "Bet"
	bet_label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	bet_label.add_theme_color_override("font_color", Color("#cad1df"))
	top_bar.add_child(bet_label)

	pai_gow_bet_spin = SpinBox.new()
	pai_gow_bet_spin.min_value = 1.0
	pai_gow_bet_spin.max_value = 100.0
	pai_gow_bet_spin.step = 1.0
	pai_gow_bet_spin.value = 10.0
	pai_gow_bet_spin.custom_minimum_size = Vector2(95, 40)
	top_bar.add_child(pai_gow_bet_spin)

	var reset_button := Button.new()
	reset_button.text = "Reset Credits"
	reset_button.custom_minimum_size = Vector2(135, 40)
	reset_button.pressed.connect(_on_pai_gow_reset_pressed)
	_apply_button_text_depth(reset_button)
	top_bar.add_child(reset_button)

	var body := HSplitContainer.new()
	body.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	body.size_flags_vertical = Control.SIZE_EXPAND_FILL
	body.dragger_visibility = SplitContainer.DRAGGER_VISIBLE
	pai_gow_root.add_child(body)

	body.add_child(_build_pai_gow_table_panel())
	body.add_child(_build_pai_gow_info_panel())


func _build_pai_gow_table_panel() -> Control:
	var panel := PanelContainer.new()
	panel.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	panel.size_flags_vertical = Control.SIZE_EXPAND_FILL
	panel.add_theme_stylebox_override("panel", _poker_table_style())

	var padding := MarginContainer.new()
	padding.add_theme_constant_override("margin_left", 16)
	padding.add_theme_constant_override("margin_top", 16)
	padding.add_theme_constant_override("margin_right", 16)
	padding.add_theme_constant_override("margin_bottom", 16)
	panel.add_child(padding)

	var layout := VBoxContainer.new()
	layout.add_theme_constant_override("separation", 12)
	padding.add_child(layout)

	pai_gow_status_label = Label.new()
	pai_gow_status_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	pai_gow_status_label.add_theme_font_size_override("font_size", 18)
	pai_gow_status_label.add_theme_color_override("font_color", Color("#f6f0df"))
	_apply_text_depth(pai_gow_status_label)
	layout.add_child(pai_gow_status_label)

	pai_gow_selection_row = HBoxContainer.new()
	pai_gow_selection_row.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	pai_gow_selection_row.add_theme_constant_override("separation", 10)
	layout.add_child(pai_gow_selection_row)

	var action_row := HBoxContainer.new()
	action_row.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	action_row.add_theme_constant_override("separation", 16)
	layout.add_child(action_row)

	pai_gow_deal_button = Button.new()
	pai_gow_deal_button.text = "Deal"
	pai_gow_deal_button.custom_minimum_size = Vector2(150, 58)
	pai_gow_deal_button.pressed.connect(_on_pai_gow_deal_pressed)
	pai_gow_deal_button.add_theme_font_size_override("font_size", 22)
	_apply_button_text_depth(pai_gow_deal_button)
	action_row.add_child(pai_gow_deal_button)

	pai_gow_house_way_button = Button.new()
	pai_gow_house_way_button.text = "House Way"
	pai_gow_house_way_button.custom_minimum_size = Vector2(170, 58)
	pai_gow_house_way_button.pressed.connect(_on_pai_gow_house_way_pressed)
	pai_gow_house_way_button.add_theme_font_size_override("font_size", 22)
	_apply_button_text_depth(pai_gow_house_way_button)
	action_row.add_child(pai_gow_house_way_button)

	pai_gow_set_button = Button.new()
	pai_gow_set_button.text = "Set Hands"
	pai_gow_set_button.custom_minimum_size = Vector2(170, 58)
	pai_gow_set_button.pressed.connect(_on_pai_gow_set_pressed)
	pai_gow_set_button.add_theme_font_size_override("font_size", 22)
	_apply_button_text_depth(pai_gow_set_button)
	action_row.add_child(pai_gow_set_button)

	pai_gow_tip_label = Label.new()
	pai_gow_tip_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	pai_gow_tip_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	pai_gow_tip_label.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	pai_gow_tip_label.add_theme_font_size_override("font_size", 22)
	pai_gow_tip_label.add_theme_color_override("font_color", Color("#c9f3df"))
	_apply_text_depth(pai_gow_tip_label)
	layout.add_child(pai_gow_tip_label)

	var split_grid := GridContainer.new()
	split_grid.columns = 2
	split_grid.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	split_grid.add_theme_constant_override("h_separation", 30)
	split_grid.add_theme_constant_override("v_separation", 10)
	layout.add_child(split_grid)

	var player_box := VBoxContainer.new()
	player_box.add_theme_constant_override("separation", 8)
	split_grid.add_child(player_box)

	pai_gow_player_low_label = Label.new()
	pai_gow_player_low_label.add_theme_font_size_override("font_size", 20)
	pai_gow_player_low_label.add_theme_color_override("font_color", Color("#f6f0df"))
	_apply_text_depth(pai_gow_player_low_label)
	player_box.add_child(pai_gow_player_low_label)

	pai_gow_player_low_row = HBoxContainer.new()
	pai_gow_player_low_row.add_theme_constant_override("separation", 8)
	player_box.add_child(pai_gow_player_low_row)

	pai_gow_player_high_label = Label.new()
	pai_gow_player_high_label.add_theme_font_size_override("font_size", 20)
	pai_gow_player_high_label.add_theme_color_override("font_color", Color("#f6f0df"))
	_apply_text_depth(pai_gow_player_high_label)
	player_box.add_child(pai_gow_player_high_label)

	pai_gow_player_high_row = HBoxContainer.new()
	pai_gow_player_high_row.add_theme_constant_override("separation", 8)
	player_box.add_child(pai_gow_player_high_row)

	var dealer_box := VBoxContainer.new()
	dealer_box.add_theme_constant_override("separation", 8)
	split_grid.add_child(dealer_box)

	pai_gow_dealer_low_label = Label.new()
	pai_gow_dealer_low_label.add_theme_font_size_override("font_size", 20)
	pai_gow_dealer_low_label.add_theme_color_override("font_color", Color("#ff7070"))
	_apply_text_depth(pai_gow_dealer_low_label)
	dealer_box.add_child(pai_gow_dealer_low_label)

	pai_gow_dealer_low_row = HBoxContainer.new()
	pai_gow_dealer_low_row.add_theme_constant_override("separation", 8)
	dealer_box.add_child(pai_gow_dealer_low_row)

	pai_gow_dealer_high_label = Label.new()
	pai_gow_dealer_high_label.add_theme_font_size_override("font_size", 20)
	pai_gow_dealer_high_label.add_theme_color_override("font_color", Color("#ff7070"))
	_apply_text_depth(pai_gow_dealer_high_label)
	dealer_box.add_child(pai_gow_dealer_high_label)

	pai_gow_dealer_high_row = HBoxContainer.new()
	pai_gow_dealer_high_row.add_theme_constant_override("separation", 8)
	dealer_box.add_child(pai_gow_dealer_high_row)

	pai_gow_result_label = Label.new()
	pai_gow_result_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	pai_gow_result_label.add_theme_font_size_override("font_size", 20)
	pai_gow_result_label.add_theme_color_override("font_color", Color("#f5d067"))
	_apply_text_depth(pai_gow_result_label)
	layout.add_child(pai_gow_result_label)

	return panel


func _build_pai_gow_info_panel() -> Control:
	var panel := PanelContainer.new()
	panel.custom_minimum_size = Vector2(430, 0)
	panel.add_theme_stylebox_override("panel", _panel_style(Color("#20242a")))

	var padding := MarginContainer.new()
	padding.add_theme_constant_override("margin_left", 12)
	padding.add_theme_constant_override("margin_top", 12)
	padding.add_theme_constant_override("margin_right", 12)
	padding.add_theme_constant_override("margin_bottom", 12)
	panel.add_child(padding)

	var layout := VBoxContainer.new()
	layout.add_theme_constant_override("separation", 10)
	padding.add_child(layout)

	var title := Label.new()
	title.text = "Pai Gow Poker"
	title.add_theme_font_size_override("font_size", 20)
	title.add_theme_color_override("font_color", Color("#f6f0df"))
	layout.add_child(title)

	var info := Label.new()
	info.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	info.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	info.add_theme_color_override("font_color", Color("#cad1df"))
	info.text = "Set seven cards into a two-card Low hand and a five-card High hand.\n\nClick exactly two cards for Low. The remaining five become High. High must outrank Low or the hand is fouled.\n\nBoth hands beat the dealer: win 1:1.\nOne wins and one loses: push.\nDealer copies win for the dealer.\n\nThis table uses a 52-card deck and no commission."
	layout.add_child(info)

	return panel


func _build_blackjack_interface() -> void:
	var top_bar := HBoxContainer.new()
	top_bar.add_theme_constant_override("separation", 10)
	blackjack_root.add_child(top_bar)

	var title := Label.new()
	title.text = "Blackjack"
	title.add_theme_font_size_override("font_size", 28)
	title.add_theme_color_override("font_color", Color("#f6f0df"))
	title.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	_apply_text_depth(title)
	top_bar.add_child(title)

	blackjack_bankroll_label = Label.new()
	blackjack_bankroll_label.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	blackjack_bankroll_label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	blackjack_bankroll_label.add_theme_font_size_override("font_size", 16)
	blackjack_bankroll_label.add_theme_color_override("font_color", Color("#cad1df"))
	_apply_text_depth(blackjack_bankroll_label)
	top_bar.add_child(blackjack_bankroll_label)

	var bet_label := Label.new()
	bet_label.text = "Bet"
	bet_label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	bet_label.add_theme_color_override("font_color", Color("#cad1df"))
	top_bar.add_child(bet_label)

	blackjack_bet_spin = SpinBox.new()
	blackjack_bet_spin.min_value = 1.0
	blackjack_bet_spin.max_value = 100.0
	blackjack_bet_spin.step = 1.0
	blackjack_bet_spin.value = 5.0
	blackjack_bet_spin.custom_minimum_size = Vector2(95, 40)
	top_bar.add_child(blackjack_bet_spin)

	var reset_button := Button.new()
	reset_button.text = "Reset Credits"
	reset_button.custom_minimum_size = Vector2(135, 40)
	reset_button.pressed.connect(_on_blackjack_reset_pressed)
	_apply_button_text_depth(reset_button)
	top_bar.add_child(reset_button)

	var body := HSplitContainer.new()
	body.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	body.size_flags_vertical = Control.SIZE_EXPAND_FILL
	body.dragger_visibility = SplitContainer.DRAGGER_VISIBLE
	blackjack_root.add_child(body)

	body.add_child(_build_blackjack_table_panel())
	body.add_child(_build_blackjack_info_panel())


func _build_blackjack_table_panel() -> Control:
	var panel := PanelContainer.new()
	panel.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	panel.size_flags_vertical = Control.SIZE_EXPAND_FILL
	panel.add_theme_stylebox_override("panel", _poker_table_style())

	var padding := MarginContainer.new()
	padding.add_theme_constant_override("margin_left", 16)
	padding.add_theme_constant_override("margin_top", 16)
	padding.add_theme_constant_override("margin_right", 16)
	padding.add_theme_constant_override("margin_bottom", 16)
	panel.add_child(padding)

	var layout := VBoxContainer.new()
	layout.add_theme_constant_override("separation", 14)
	padding.add_child(layout)

	blackjack_status_label = Label.new()
	blackjack_status_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	blackjack_status_label.add_theme_font_size_override("font_size", 18)
	blackjack_status_label.add_theme_color_override("font_color", Color("#f6f0df"))
	_apply_text_depth(blackjack_status_label)
	layout.add_child(blackjack_status_label)

	blackjack_dealer_total_label = Label.new()
	blackjack_dealer_total_label.add_theme_font_size_override("font_size", 20)
	blackjack_dealer_total_label.add_theme_color_override("font_color", Color("#f6f0df"))
	_apply_text_depth(blackjack_dealer_total_label)
	layout.add_child(blackjack_dealer_total_label)

	blackjack_dealer_row = HBoxContainer.new()
	blackjack_dealer_row.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	blackjack_dealer_row.add_theme_constant_override("separation", 14)
	layout.add_child(blackjack_dealer_row)

	blackjack_player_total_label = Label.new()
	blackjack_player_total_label.add_theme_font_size_override("font_size", 20)
	blackjack_player_total_label.add_theme_color_override("font_color", Color("#f6f0df"))
	_apply_text_depth(blackjack_player_total_label)
	layout.add_child(blackjack_player_total_label)

	blackjack_player_row = HBoxContainer.new()
	blackjack_player_row.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	blackjack_player_row.add_theme_constant_override("separation", 14)
	layout.add_child(blackjack_player_row)

	var action_row := HBoxContainer.new()
	action_row.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	action_row.add_theme_constant_override("separation", 16)
	layout.add_child(action_row)

	blackjack_deal_button = Button.new()
	blackjack_deal_button.text = "Deal"
	blackjack_deal_button.custom_minimum_size = Vector2(170, 58)
	blackjack_deal_button.pressed.connect(_on_blackjack_deal_pressed)
	blackjack_deal_button.add_theme_font_size_override("font_size", 22)
	_apply_button_text_depth(blackjack_deal_button)
	action_row.add_child(blackjack_deal_button)

	blackjack_hit_button = Button.new()
	blackjack_hit_button.text = "Hit"
	blackjack_hit_button.custom_minimum_size = Vector2(150, 58)
	blackjack_hit_button.pressed.connect(_on_blackjack_hit_pressed)
	blackjack_hit_button.add_theme_font_size_override("font_size", 22)
	_apply_button_text_depth(blackjack_hit_button)
	action_row.add_child(blackjack_hit_button)

	blackjack_stand_button = Button.new()
	blackjack_stand_button.text = "Stand"
	blackjack_stand_button.custom_minimum_size = Vector2(150, 58)
	blackjack_stand_button.pressed.connect(_on_blackjack_stand_pressed)
	blackjack_stand_button.add_theme_font_size_override("font_size", 22)
	_apply_button_text_depth(blackjack_stand_button)
	action_row.add_child(blackjack_stand_button)

	blackjack_tip_label = Label.new()
	blackjack_tip_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	blackjack_tip_label.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	blackjack_tip_label.add_theme_font_size_override("font_size", 24)
	blackjack_tip_label.add_theme_color_override("font_color", Color("#c9f3df"))
	_apply_text_depth(blackjack_tip_label)
	layout.add_child(blackjack_tip_label)

	blackjack_result_label = Label.new()
	blackjack_result_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	blackjack_result_label.add_theme_font_size_override("font_size", 20)
	blackjack_result_label.add_theme_color_override("font_color", Color("#f5d067"))
	_apply_text_depth(blackjack_result_label)
	layout.add_child(blackjack_result_label)

	return panel


func _build_blackjack_info_panel() -> Control:
	var panel := PanelContainer.new()
	panel.custom_minimum_size = Vector2(410, 0)
	panel.add_theme_stylebox_override("panel", _panel_style(Color("#20242a")))

	var padding := MarginContainer.new()
	padding.add_theme_constant_override("margin_left", 12)
	padding.add_theme_constant_override("margin_top", 12)
	padding.add_theme_constant_override("margin_right", 12)
	padding.add_theme_constant_override("margin_bottom", 12)
	panel.add_child(padding)

	var layout := VBoxContainer.new()
	layout.add_theme_constant_override("separation", 10)
	padding.add_child(layout)

	var title := Label.new()
	title.text = "Blackjack"
	title.add_theme_font_size_override("font_size", 20)
	title.add_theme_color_override("font_color", Color("#f6f0df"))
	layout.add_child(title)

	var info := Label.new()
	info.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	info.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	info.add_theme_color_override("font_color", Color("#cad1df"))
	info.text = "Goal: beat the dealer without going over 21.\n\nDealer stands on 17.\nBlackjack pays 3:2.\nWin pays 1:1.\nPush returns your bet.\n\nTips use simple basic strategy for Hit or Stand."
	layout.add_child(info)

	return panel


func _build_three_card_interface() -> void:
	var top_bar := HBoxContainer.new()
	top_bar.add_theme_constant_override("separation", 10)
	three_card_root.add_child(top_bar)

	var title := Label.new()
	title.text = "3 Card Poker"
	title.add_theme_font_size_override("font_size", 28)
	title.add_theme_color_override("font_color", Color("#f6f0df"))
	title.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	_apply_text_depth(title)
	top_bar.add_child(title)

	three_card_bankroll_label = Label.new()
	three_card_bankroll_label.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	three_card_bankroll_label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	three_card_bankroll_label.add_theme_font_size_override("font_size", 16)
	three_card_bankroll_label.add_theme_color_override("font_color", Color("#cad1df"))
	_apply_text_depth(three_card_bankroll_label)
	top_bar.add_child(three_card_bankroll_label)

	var ante_label := Label.new()
	ante_label.text = "Ante"
	ante_label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	ante_label.add_theme_color_override("font_color", Color("#cad1df"))
	top_bar.add_child(ante_label)

	three_card_ante_spin = SpinBox.new()
	three_card_ante_spin.min_value = 1.0
	three_card_ante_spin.max_value = 100.0
	three_card_ante_spin.step = 1.0
	three_card_ante_spin.value = 5.0
	three_card_ante_spin.custom_minimum_size = Vector2(95, 40)
	top_bar.add_child(three_card_ante_spin)

	var pair_label := Label.new()
	pair_label.text = "Pair Plus"
	pair_label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	pair_label.add_theme_color_override("font_color", Color("#cad1df"))
	top_bar.add_child(pair_label)

	three_card_pair_plus_spin = SpinBox.new()
	three_card_pair_plus_spin.min_value = 0.0
	three_card_pair_plus_spin.max_value = 100.0
	three_card_pair_plus_spin.step = 1.0
	three_card_pair_plus_spin.value = 1.0
	three_card_pair_plus_spin.custom_minimum_size = Vector2(95, 40)
	top_bar.add_child(three_card_pair_plus_spin)

	var reset_button := Button.new()
	reset_button.text = "Reset Credits"
	reset_button.custom_minimum_size = Vector2(135, 40)
	reset_button.pressed.connect(_on_three_card_reset_pressed)
	_apply_button_text_depth(reset_button)
	top_bar.add_child(reset_button)

	var body := HSplitContainer.new()
	body.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	body.size_flags_vertical = Control.SIZE_EXPAND_FILL
	body.dragger_visibility = SplitContainer.DRAGGER_VISIBLE
	three_card_root.add_child(body)

	body.add_child(_build_three_card_table_panel())
	body.add_child(_build_three_card_info_panel())


func _build_three_card_table_panel() -> Control:
	var panel := PanelContainer.new()
	panel.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	panel.size_flags_vertical = Control.SIZE_EXPAND_FILL
	panel.add_theme_stylebox_override("panel", _poker_table_style())

	var padding := MarginContainer.new()
	padding.add_theme_constant_override("margin_left", 16)
	padding.add_theme_constant_override("margin_top", 16)
	padding.add_theme_constant_override("margin_right", 16)
	padding.add_theme_constant_override("margin_bottom", 16)
	panel.add_child(padding)

	var layout := VBoxContainer.new()
	layout.add_theme_constant_override("separation", 14)
	padding.add_child(layout)

	three_card_status_label = Label.new()
	three_card_status_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	three_card_status_label.add_theme_font_size_override("font_size", 18)
	three_card_status_label.add_theme_color_override("font_color", Color("#f6f0df"))
	_apply_text_depth(three_card_status_label)
	layout.add_child(three_card_status_label)

	three_card_dealer_label = Label.new()
	three_card_dealer_label.add_theme_font_size_override("font_size", 20)
	three_card_dealer_label.add_theme_color_override("font_color", Color("#f6f0df"))
	_apply_text_depth(three_card_dealer_label)
	layout.add_child(three_card_dealer_label)

	three_card_dealer_row = HBoxContainer.new()
	three_card_dealer_row.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	three_card_dealer_row.add_theme_constant_override("separation", 14)
	layout.add_child(three_card_dealer_row)

	three_card_player_label = Label.new()
	three_card_player_label.add_theme_font_size_override("font_size", 20)
	three_card_player_label.add_theme_color_override("font_color", Color("#f6f0df"))
	_apply_text_depth(three_card_player_label)
	layout.add_child(three_card_player_label)

	three_card_player_row = HBoxContainer.new()
	three_card_player_row.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	three_card_player_row.add_theme_constant_override("separation", 14)
	layout.add_child(three_card_player_row)

	var action_row := HBoxContainer.new()
	action_row.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	action_row.add_theme_constant_override("separation", 16)
	layout.add_child(action_row)

	three_card_deal_button = Button.new()
	three_card_deal_button.text = "Deal"
	three_card_deal_button.custom_minimum_size = Vector2(170, 58)
	three_card_deal_button.pressed.connect(_on_three_card_deal_pressed)
	three_card_deal_button.add_theme_font_size_override("font_size", 22)
	_apply_button_text_depth(three_card_deal_button)
	action_row.add_child(three_card_deal_button)

	three_card_play_button = Button.new()
	three_card_play_button.text = "Play"
	three_card_play_button.custom_minimum_size = Vector2(150, 58)
	three_card_play_button.pressed.connect(_on_three_card_play_pressed)
	three_card_play_button.add_theme_font_size_override("font_size", 22)
	_apply_button_text_depth(three_card_play_button)
	action_row.add_child(three_card_play_button)

	three_card_fold_button = Button.new()
	three_card_fold_button.text = "Fold"
	three_card_fold_button.custom_minimum_size = Vector2(150, 58)
	three_card_fold_button.pressed.connect(_on_three_card_fold_pressed)
	three_card_fold_button.add_theme_font_size_override("font_size", 22)
	_apply_button_text_depth(three_card_fold_button)
	action_row.add_child(three_card_fold_button)

	three_card_tip_label = Label.new()
	three_card_tip_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	three_card_tip_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	three_card_tip_label.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	three_card_tip_label.add_theme_font_size_override("font_size", 24)
	three_card_tip_label.add_theme_color_override("font_color", Color("#c9f3df"))
	_apply_text_depth(three_card_tip_label)
	layout.add_child(three_card_tip_label)

	three_card_result_label = Label.new()
	three_card_result_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	three_card_result_label.add_theme_font_size_override("font_size", 20)
	three_card_result_label.add_theme_color_override("font_color", Color("#f5d067"))
	_apply_text_depth(three_card_result_label)
	layout.add_child(three_card_result_label)

	return panel


func _build_three_card_info_panel() -> Control:
	var panel := PanelContainer.new()
	panel.custom_minimum_size = Vector2(430, 0)
	panel.add_theme_stylebox_override("panel", _panel_style(Color("#20242a")))

	var padding := MarginContainer.new()
	padding.add_theme_constant_override("margin_left", 12)
	padding.add_theme_constant_override("margin_top", 12)
	padding.add_theme_constant_override("margin_right", 12)
	padding.add_theme_constant_override("margin_bottom", 12)
	panel.add_child(padding)

	var layout := VBoxContainer.new()
	layout.add_theme_constant_override("separation", 10)
	padding.add_child(layout)

	var title := Label.new()
	title.text = "3 Card Poker"
	title.add_theme_font_size_override("font_size", 20)
	title.add_theme_color_override("font_color", Color("#f6f0df"))
	layout.add_child(title)

	var info := Label.new()
	info.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	info.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	info.add_theme_color_override("font_color", Color("#cad1df"))
	info.text = "Ante: deal 3 cards, then Play with another Ante-sized bet or Fold.\n\nDealer qualifies with Queen-high or better.\n\nPair Plus pays on your hand only:\nStraight Flush 40:1\nThree of a Kind 30:1\nStraight 6:1\nFlush 3:1\nPair 1:1\n\nAnte bonus:\nStraight Flush 5:1\nThree of a Kind 4:1\nStraight 1:1"
	layout.add_child(info)

	return panel


func _build_baccarat_interface() -> void:
	var top_bar := HBoxContainer.new()
	top_bar.add_theme_constant_override("separation", 10)
	baccarat_root.add_child(top_bar)

	var title := Label.new()
	title.text = "Baccarat"
	title.add_theme_font_size_override("font_size", 28)
	title.add_theme_color_override("font_color", Color("#f6f0df"))
	title.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	_apply_text_depth(title)
	top_bar.add_child(title)

	baccarat_bankroll_label = Label.new()
	baccarat_bankroll_label.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	baccarat_bankroll_label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	baccarat_bankroll_label.add_theme_font_size_override("font_size", 16)
	baccarat_bankroll_label.add_theme_color_override("font_color", Color("#cad1df"))
	_apply_text_depth(baccarat_bankroll_label)
	top_bar.add_child(baccarat_bankroll_label)

	var bet_label := Label.new()
	bet_label.text = "Bet"
	bet_label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	bet_label.add_theme_color_override("font_color", Color("#cad1df"))
	top_bar.add_child(bet_label)

	baccarat_bet_spin = SpinBox.new()
	baccarat_bet_spin.min_value = 1.0
	baccarat_bet_spin.max_value = 100.0
	baccarat_bet_spin.step = 1.0
	baccarat_bet_spin.value = 5.0
	baccarat_bet_spin.custom_minimum_size = Vector2(95, 40)
	top_bar.add_child(baccarat_bet_spin)

	baccarat_bet_option = OptionButton.new()
	baccarat_bet_option.custom_minimum_size = Vector2(125, 40)
	for option in BACCARAT_BET_OPTIONS:
		baccarat_bet_option.add_item(option)
	baccarat_bet_option.select(1)
	top_bar.add_child(baccarat_bet_option)

	var reset_button := Button.new()
	reset_button.text = "Reset Credits"
	reset_button.custom_minimum_size = Vector2(135, 40)
	reset_button.pressed.connect(_on_baccarat_reset_pressed)
	_apply_button_text_depth(reset_button)
	top_bar.add_child(reset_button)

	var body := HSplitContainer.new()
	body.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	body.size_flags_vertical = Control.SIZE_EXPAND_FILL
	body.dragger_visibility = SplitContainer.DRAGGER_VISIBLE
	baccarat_root.add_child(body)

	body.add_child(_build_baccarat_table_panel())
	body.add_child(_build_baccarat_info_panel())


func _build_baccarat_table_panel() -> Control:
	var panel := PanelContainer.new()
	panel.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	panel.size_flags_vertical = Control.SIZE_EXPAND_FILL
	panel.add_theme_stylebox_override("panel", _poker_table_style())

	var padding := MarginContainer.new()
	padding.add_theme_constant_override("margin_left", 16)
	padding.add_theme_constant_override("margin_top", 16)
	padding.add_theme_constant_override("margin_right", 16)
	padding.add_theme_constant_override("margin_bottom", 16)
	panel.add_child(padding)

	var layout := VBoxContainer.new()
	layout.add_theme_constant_override("separation", 12)
	padding.add_child(layout)

	baccarat_status_label = Label.new()
	baccarat_status_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	baccarat_status_label.add_theme_font_size_override("font_size", 18)
	baccarat_status_label.add_theme_color_override("font_color", Color("#f6f0df"))
	_apply_text_depth(baccarat_status_label)
	layout.add_child(baccarat_status_label)

	baccarat_table_texture = TextureRect.new()
	baccarat_table_texture.custom_minimum_size = Vector2(560, 255)
	baccarat_table_texture.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	baccarat_table_texture.expand_mode = TextureRect.EXPAND_FIT_WIDTH_PROPORTIONAL
	baccarat_table_texture.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
	if ResourceLoader.exists(BACCARAT_TABLE_IMAGE):
		baccarat_table_texture.texture = load(BACCARAT_TABLE_IMAGE)
	layout.add_child(baccarat_table_texture)

	var totals := HBoxContainer.new()
	totals.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	totals.add_theme_constant_override("separation", 90)
	layout.add_child(totals)

	baccarat_player_label = Label.new()
	baccarat_player_label.add_theme_font_size_override("font_size", 22)
	baccarat_player_label.add_theme_color_override("font_color", Color("#f6f0df"))
	_apply_text_depth(baccarat_player_label)
	totals.add_child(baccarat_player_label)

	baccarat_banker_label = Label.new()
	baccarat_banker_label.add_theme_font_size_override("font_size", 22)
	baccarat_banker_label.add_theme_color_override("font_color", Color("#ff7070"))
	_apply_text_depth(baccarat_banker_label)
	totals.add_child(baccarat_banker_label)

	var rows := HBoxContainer.new()
	rows.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	rows.add_theme_constant_override("separation", 46)
	layout.add_child(rows)

	baccarat_player_row = HBoxContainer.new()
	baccarat_player_row.add_theme_constant_override("separation", 10)
	rows.add_child(baccarat_player_row)

	baccarat_banker_row = HBoxContainer.new()
	baccarat_banker_row.add_theme_constant_override("separation", 10)
	rows.add_child(baccarat_banker_row)

	var action_row := HBoxContainer.new()
	action_row.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	action_row.add_theme_constant_override("separation", 16)
	layout.add_child(action_row)

	baccarat_deal_button = Button.new()
	baccarat_deal_button.text = "Deal"
	baccarat_deal_button.custom_minimum_size = Vector2(190, 62)
	baccarat_deal_button.pressed.connect(_on_baccarat_deal_pressed)
	baccarat_deal_button.add_theme_font_size_override("font_size", 22)
	_apply_button_text_depth(baccarat_deal_button)
	action_row.add_child(baccarat_deal_button)

	baccarat_tip_label = Label.new()
	baccarat_tip_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	baccarat_tip_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	baccarat_tip_label.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	baccarat_tip_label.add_theme_font_size_override("font_size", 24)
	baccarat_tip_label.add_theme_color_override("font_color", Color("#c9f3df"))
	_apply_text_depth(baccarat_tip_label)
	layout.add_child(baccarat_tip_label)

	baccarat_result_label = Label.new()
	baccarat_result_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	baccarat_result_label.add_theme_font_size_override("font_size", 20)
	baccarat_result_label.add_theme_color_override("font_color", Color("#f5d067"))
	_apply_text_depth(baccarat_result_label)
	layout.add_child(baccarat_result_label)

	return panel


func _build_baccarat_info_panel() -> Control:
	var panel := PanelContainer.new()
	panel.custom_minimum_size = Vector2(430, 0)
	panel.add_theme_stylebox_override("panel", _panel_style(Color("#20242a")))

	var padding := MarginContainer.new()
	padding.add_theme_constant_override("margin_left", 12)
	padding.add_theme_constant_override("margin_top", 12)
	padding.add_theme_constant_override("margin_right", 12)
	padding.add_theme_constant_override("margin_bottom", 12)
	panel.add_child(padding)

	var layout := VBoxContainer.new()
	layout.add_theme_constant_override("separation", 10)
	padding.add_child(layout)

	var title := Label.new()
	title.text = "Baccarat"
	title.add_theme_font_size_override("font_size", 20)
	title.add_theme_color_override("font_color", Color("#f6f0df"))
	layout.add_child(title)

	var info := Label.new()
	info.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	info.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	info.add_theme_color_override("font_color", Color("#cad1df"))
	info.text = "Bet Player, Banker, or Tie before dealing.\n\nCards total by last digit only. Tens and face cards count as 0, aces count as 1.\n\nNatural 8 or 9 stands.\nPlayer and Banker third-card rules are automatic.\n\nPayouts:\nPlayer 1:1\nBanker 0.95:1\nTie 8:1"
	layout.add_child(info)

	return panel


func _build_craps_interface() -> void:
	var top_bar := HBoxContainer.new()
	top_bar.add_theme_constant_override("separation", 10)
	craps_root.add_child(top_bar)

	var title := Label.new()
	title.text = "Craps Royale"
	title.add_theme_font_size_override("font_size", 28)
	title.add_theme_color_override("font_color", Color("#f6f0df"))
	title.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	_apply_text_depth(title)
	top_bar.add_child(title)

	craps_bankroll_label = Label.new()
	craps_bankroll_label.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	craps_bankroll_label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	craps_bankroll_label.add_theme_font_size_override("font_size", 16)
	craps_bankroll_label.add_theme_color_override("font_color", Color("#cad1df"))
	_apply_text_depth(craps_bankroll_label)
	top_bar.add_child(craps_bankroll_label)

	craps_reset_button = Button.new()
	craps_reset_button.text = "Reset Table"
	craps_reset_button.custom_minimum_size = Vector2(125, 40)
	craps_reset_button.pressed.connect(_on_craps_reset_pressed)
	_apply_button_text_depth(craps_reset_button)
	top_bar.add_child(craps_reset_button)

	if not SHOW_CASINO_GAME_TABS:
		var exit_button := Button.new()
		exit_button.text = "Exit"
		exit_button.custom_minimum_size = Vector2(100, 40)
		exit_button.pressed.connect(_on_exit_pressed)
		_apply_button_text_depth(exit_button)
		_apply_exit_button_style(exit_button)
		top_bar.add_child(exit_button)

	var body := HSplitContainer.new()
	body.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	body.size_flags_vertical = Control.SIZE_EXPAND_FILL
	body.dragger_visibility = SplitContainer.DRAGGER_VISIBLE
	craps_root.add_child(body)

	body.add_child(_build_craps_table_panel())
	body.add_child(_build_craps_info_panel())


func _build_craps_table_panel() -> Control:
	var panel := PanelContainer.new()
	panel.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	panel.size_flags_vertical = Control.SIZE_EXPAND_FILL
	panel.add_theme_stylebox_override("panel", _craps_table_style())

	var padding := MarginContainer.new()
	padding.add_theme_constant_override("margin_left", 18)
	padding.add_theme_constant_override("margin_top", 18)
	padding.add_theme_constant_override("margin_right", 18)
	padding.add_theme_constant_override("margin_bottom", 18)
	panel.add_child(padding)

	craps_table_surface = Control.new()
	craps_table_surface.custom_minimum_size = Vector2(1200, 760)
	craps_table_surface.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	craps_table_surface.size_flags_vertical = Control.SIZE_EXPAND_FILL
	craps_table_surface.clip_contents = true
	craps_table_surface.resized.connect(_layout_craps_table_overlays)
	padding.add_child(craps_table_surface)

	craps_table_texture = TextureRect.new()
	craps_table_texture.set_anchors_preset(Control.PRESET_FULL_RECT)
	craps_table_texture.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	craps_table_texture.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
	craps_table_texture.mouse_filter = Control.MOUSE_FILTER_IGNORE
	if ResourceLoader.exists(CRAPS_TABLE_IMAGE):
		craps_table_texture.texture = load(CRAPS_TABLE_IMAGE)
	else:
		var table_image := Image.load_from_file(CRAPS_TABLE_IMAGE)
		if table_image != null and not table_image.is_empty():
			craps_table_texture.texture = ImageTexture.create_from_image(table_image)
	craps_table_surface.add_child(craps_table_texture)

	craps_status_label = Label.new()
	craps_status_label.position = Vector2(18, 14)
	craps_status_label.size = Vector2(760, 36)
	craps_status_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	craps_status_label.add_theme_font_size_override("font_size", 20)
	craps_status_label.add_theme_color_override("font_color", Color("#f6f0df"))
	_apply_text_depth(craps_status_label)
	craps_table_surface.add_child(craps_status_label)

	for number in CRAPS_POINT_NUMBERS:
		var marker := Button.new()
		marker.text = str(number)
		marker.custom_minimum_size = Vector2(70, 42)
		marker.size = Vector2(70, 42)
		marker.disabled = true
		marker.add_theme_font_size_override("font_size", 22)
		marker.add_theme_color_override("font_color", Color("#f6f0df"))
		marker.add_theme_stylebox_override("normal", _craps_point_style(false))
		marker.add_theme_stylebox_override("disabled", _craps_point_style(false))
		_apply_button_text_depth(marker)
		craps_point_markers[number] = marker
		craps_table_surface.add_child(marker)

	craps_die_one = _build_craps_die()
	craps_die_two = _build_craps_die()
	craps_die_one.position = Vector2(-220, -220)
	craps_die_two.position = Vector2(-220, -220)
	craps_die_one.z_index = 10
	craps_die_two.z_index = 10
	craps_table_surface.add_child(craps_die_one)
	craps_table_surface.add_child(craps_die_two)

	craps_roll_button = Button.new()
	craps_roll_button.text = "Roll Dice"
	craps_roll_button.custom_minimum_size = Vector2(150, 54)
	craps_roll_button.size = Vector2(150, 54)
	craps_roll_button.add_theme_font_size_override("font_size", 24)
	craps_roll_button.pressed.connect(_on_craps_roll_pressed)
	_apply_button_text_depth(craps_roll_button)
	craps_table_surface.add_child(craps_roll_button)

	craps_point_label = Label.new()
	craps_point_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	craps_point_label.size = Vector2(170, 34)
	craps_point_label.add_theme_font_size_override("font_size", 22)
	craps_point_label.add_theme_color_override("font_color", Color("#f5d067"))
	_apply_text_depth(craps_point_label)
	craps_table_surface.add_child(craps_point_label)

	_add_craps_bet_zones()

	craps_chip_layer = Control.new()
	craps_chip_layer.set_anchors_preset(Control.PRESET_FULL_RECT)
	craps_chip_layer.mouse_filter = Control.MOUSE_FILTER_IGNORE
	craps_chip_layer.z_index = 6
	craps_table_surface.add_child(craps_chip_layer)

	craps_chip_selector_row = HBoxContainer.new()
	craps_chip_selector_row.add_theme_constant_override("separation", 10)
	craps_chip_selector_row.z_index = 8
	craps_table_surface.add_child(craps_chip_selector_row)
	for denomination in CRAPS_CHIP_DENOMINATIONS:
		var chip_button := Button.new()
		chip_button.text = "$%d" % int(denomination)
		chip_button.toggle_mode = true
		chip_button.custom_minimum_size = Vector2(72, 72)
		chip_button.tooltip_text = "Use a $%d chip." % int(denomination)
		chip_button.pressed.connect(_on_craps_chip_selected.bind(float(denomination)))
		var chip_texture := _get_craps_chip_texture(float(denomination))
		if chip_texture != null:
			chip_button.icon = chip_texture
			chip_button.expand_icon = true
			chip_button.icon_alignment = HORIZONTAL_ALIGNMENT_CENTER
			chip_button.vertical_icon_alignment = VERTICAL_ALIGNMENT_CENTER
			chip_button.text = ""
		chip_button.add_theme_font_size_override("font_size", 18)
		_apply_button_text_depth(chip_button)
		craps_chip_selector_buttons[float(denomination)] = chip_button
		craps_chip_selector_row.add_child(chip_button)

	craps_tip_label = Label.new()
	craps_tip_label.size = Vector2(760, 34)
	craps_tip_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	craps_tip_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	craps_tip_label.add_theme_font_size_override("font_size", 22)
	craps_tip_label.add_theme_color_override("font_color", Color("#c9f3df"))
	_apply_text_depth(craps_tip_label)
	craps_table_surface.add_child(craps_tip_label)

	craps_result_label = Label.new()
	craps_result_label.size = Vector2(760, 86)
	craps_result_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	craps_result_label.add_theme_font_size_override("font_size", 20)
	craps_result_label.add_theme_color_override("font_color", Color("#f5d067"))
	_apply_text_depth(craps_result_label)
	craps_table_surface.add_child(craps_result_label)

	call_deferred("_layout_craps_table_overlays")
	return panel


func _build_craps_info_panel() -> Control:
	var panel := PanelContainer.new()
	panel.custom_minimum_size = Vector2(430, 0)
	panel.add_theme_stylebox_override("panel", _panel_style(Color("#20242a")))

	var padding := MarginContainer.new()
	padding.add_theme_constant_override("margin_left", 12)
	padding.add_theme_constant_override("margin_top", 12)
	padding.add_theme_constant_override("margin_right", 12)
	padding.add_theme_constant_override("margin_bottom", 12)
	panel.add_child(padding)

	var layout := VBoxContainer.new()
	layout.add_theme_constant_override("separation", 12)
	padding.add_child(layout)

	var title := Label.new()
	title.text = "Shooter Rail"
	title.add_theme_font_size_override("font_size", 20)
	title.add_theme_color_override("font_color", Color("#f6f0df"))
	_apply_text_depth(title)
	layout.add_child(title)

	craps_bets_label = Label.new()
	craps_bets_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	craps_bets_label.add_theme_color_override("font_color", Color("#cad1df"))
	layout.add_child(craps_bets_label)

	craps_history_label = Label.new()
	craps_history_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	craps_history_label.add_theme_color_override("font_color", Color("#cad1df"))
	layout.add_child(craps_history_label)

	var separator := HSeparator.new()
	layout.add_child(separator)

	var how_to_title := Label.new()
	how_to_title.text = "How To Play"
	how_to_title.add_theme_font_size_override("font_size", 18)
	how_to_title.add_theme_color_override("font_color", Color("#f6f0df"))
	_apply_text_depth(how_to_title)
	layout.add_child(how_to_title)

	var rules_scroll := ScrollContainer.new()
	rules_scroll.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	rules_scroll.size_flags_vertical = Control.SIZE_EXPAND_FILL
	rules_scroll.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
	layout.add_child(rules_scroll)

	var rules := Label.new()
	rules.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	rules.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	rules.add_theme_color_override("font_color", Color("#cad1df"))
	rules.text = _craps_rules_text()
	rules_scroll.add_child(rules)

	return panel


func _build_craps_die() -> TextureRect:
	var die := TextureRect.new()
	die.custom_minimum_size = CRAPS_DICE_DISPLAY_SIZE
	die.size = CRAPS_DICE_DISPLAY_SIZE
	die.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	die.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
	die.mouse_filter = Control.MOUSE_FILTER_IGNORE
	die.texture = _get_craps_die_texture(1)
	die.pivot_offset = CRAPS_DICE_DISPLAY_SIZE * 0.5
	return die


func _build_craps_bet_spot(title: String, key: String, tooltip: String, color: Color, accent: Color) -> Button:
	var button := Button.new()
	button.custom_minimum_size = Vector2(220, 104)
	button.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	button.text = "%s\n$0" % title
	button.tooltip_text = tooltip
	button.set_meta("craps_title", title)
	button.set_meta("craps_color", color)
	button.set_meta("craps_accent", accent)
	button.pressed.connect(_on_craps_bet_pressed.bind(key))
	button.add_theme_font_size_override("font_size", 18)
	button.add_theme_color_override("font_color", Color("#ffffff"))
	_apply_button_text_depth(button)
	craps_bet_labels[key] = button
	button.add_theme_stylebox_override("normal", _craps_bet_spot_style(color, accent, false))
	button.add_theme_stylebox_override("hover", _craps_bet_spot_style(color.lightened(0.08), Color("#f6f0df"), true))
	button.add_theme_stylebox_override("pressed", _craps_bet_spot_style(color.darkened(0.08), Color("#ffffff"), true, true))
	return button


func _add_craps_bet_zones() -> void:
	for key in CRAPS_BET_ZONE_RECTS.keys():
		var buttons := []
		var rects: Array = CRAPS_BET_ZONE_RECTS[key]
		for zone_index in rects.size():
			var zone := Button.new()
			zone.text = ""
			zone.flat = true
			zone.focus_mode = Control.FOCUS_NONE
			zone.tooltip_text = "%s: %s" % [_craps_bet_display_name(str(key)), _craps_bet_tooltip(str(key))]
			zone.set_meta("craps_key", str(key))
			zone.set_meta("craps_reference_rect", rects[zone_index])
			zone.pressed.connect(_on_craps_bet_pressed.bind(str(key)))
			zone.z_index = 4
			_apply_craps_zone_style(zone, false, false)
			craps_table_surface.add_child(zone)
			buttons.append(zone)
		craps_bet_labels[key] = buttons


func _craps_bet_tooltip(key: String) -> String:
	match key:
		"pass":
			return "Come-out 7 or 11 wins. After a point is set, the point repeats before 7."
		"dont_pass":
			return "Come-out 2 or 3 wins, 12 pushes, 7 or 11 loses. After point, 7 wins."
		"field":
			return "One-roll bet. 3, 4, 9, 10, 11 pay even; 2 pays 2:1; 12 pays 3:1."
		"big_6_8":
			return "Working bet. 6 or 8 pays even money before a 7."
		"any_craps":
			return "One-roll bet. 2, 3, or 12 pays 7:1."
		"yo":
			return "One-roll bet. 11 pays 15:1."
		"hard_4":
			return "Hard 4 pays 7:1 if 2+2 rolls before easy 4 or 7."
		"hard_6":
			return "Hard 6 pays 9:1 if 3+3 rolls before easy 6 or 7."
		"hard_8":
			return "Hard 8 pays 9:1 if 4+4 rolls before easy 8 or 7."
		"hard_10":
			return "Hard 10 pays 7:1 if 5+5 rolls before easy 10 or 7."
	return "Place a chip on this betting area."


func _layout_craps_table_overlays() -> void:
	if craps_table_surface == null:
		return

	var image_rect := _craps_table_image_rect()
	for key in craps_bet_labels.keys():
		var buttons: Array = craps_bet_labels[key]
		var rects: Array = CRAPS_BET_ZONE_RECTS[key]
		for index in min(buttons.size(), rects.size()):
			var button: Button = buttons[index]
			var zone_rect: Rect2 = rects[index]
			var mapped_rect := _map_craps_reference_rect(zone_rect, image_rect)
			button.position = mapped_rect.position
			button.size = mapped_rect.size

	for number in craps_point_markers.keys():
		var marker: Button = craps_point_markers[number]
		var reference_position: Vector2 = CRAPS_POINT_MARKER_POSITIONS.get(number, Vector2.ZERO)
		var mapped_position := _map_craps_reference_point(reference_position, image_rect)
		marker.position = mapped_position - marker.size * 0.5

	if craps_roll_button != null:
		var roll_position := _map_craps_reference_point(Vector2(900, 82), image_rect)
		craps_roll_button.position = roll_position - craps_roll_button.size * 0.5

	if craps_point_label != null:
		var point_position := _map_craps_reference_point(Vector2(900, 135), image_rect)
		craps_point_label.position = point_position - craps_point_label.size * 0.5

	if craps_tip_label != null:
		craps_tip_label.position = Vector2((craps_table_surface.size.x - craps_tip_label.size.x) * 0.5, max(48.0, craps_table_surface.size.y - 154.0))

	if craps_result_label != null:
		craps_result_label.position = Vector2(20, max(86.0, craps_table_surface.size.y - 96.0))

	if craps_chip_selector_row != null:
		var selector_size := craps_chip_selector_row.get_combined_minimum_size()
		craps_chip_selector_row.position = Vector2(
			(craps_table_surface.size.x - selector_size.x) * 0.5,
			max(64.0, craps_table_surface.size.y - 82.0)
		)

	_refresh_craps_chips()
	_place_craps_dice_at_rest()


func _craps_table_image_rect() -> Rect2:
	if craps_table_surface == null:
		return Rect2(Vector2.ZERO, CRAPS_TABLE_REFERENCE_SIZE)

	var surface_size := craps_table_surface.size
	if surface_size.x <= 0.0 or surface_size.y <= 0.0:
		return Rect2(Vector2.ZERO, CRAPS_TABLE_REFERENCE_SIZE)

	var scale: float = min(surface_size.x / CRAPS_TABLE_REFERENCE_SIZE.x, surface_size.y / CRAPS_TABLE_REFERENCE_SIZE.y)
	var displayed_size: Vector2 = CRAPS_TABLE_REFERENCE_SIZE * scale
	var origin: Vector2 = (surface_size - displayed_size) * 0.5
	return Rect2(origin, displayed_size)


func _map_craps_reference_point(point: Vector2, image_rect: Rect2) -> Vector2:
	return image_rect.position + Vector2(
		(point.x / CRAPS_TABLE_REFERENCE_SIZE.x) * image_rect.size.x,
		(point.y / CRAPS_TABLE_REFERENCE_SIZE.y) * image_rect.size.y
	)


func _map_craps_reference_rect(reference_rect: Rect2, image_rect: Rect2) -> Rect2:
	var top_left := _map_craps_reference_point(reference_rect.position, image_rect)
	var bottom_right := _map_craps_reference_point(reference_rect.position + reference_rect.size, image_rect)
	return Rect2(top_left, bottom_right - top_left)


func _refresh_craps_chips() -> void:
	if craps_chip_layer == null:
		return

	for child in craps_chip_layer.get_children():
		child.queue_free()

	var image_rect := _craps_table_image_rect()
	for key in craps_bets.keys():
		var amount := float(craps_bets.get(key, 0.0))
		if amount <= 0.0:
			continue

		var chip := _build_craps_chip(amount)
		var chip_position := _map_craps_reference_point(CRAPS_CHIP_POSITIONS.get(key, Vector2(750, 520)), image_rect)
		chip.position = chip_position - chip.custom_minimum_size * 0.5
		craps_chip_layer.add_child(chip)


func _build_craps_chip(amount: float) -> Control:
	var chip := Control.new()
	chip.custom_minimum_size = Vector2(78, 78)
	chip.size = chip.custom_minimum_size
	chip.mouse_filter = Control.MOUSE_FILTER_IGNORE

	var texture := _get_craps_chip_texture(amount)
	if texture != null:
		var image := TextureRect.new()
		image.set_anchors_preset(Control.PRESET_FULL_RECT)
		image.texture = texture
		image.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
		image.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
		image.mouse_filter = Control.MOUSE_FILTER_IGNORE
		chip.add_child(image)
	else:
		var fallback := PanelContainer.new()
		fallback.set_anchors_preset(Control.PRESET_FULL_RECT)
		fallback.add_theme_stylebox_override("panel", _craps_chip_style())
		fallback.mouse_filter = Control.MOUSE_FILTER_IGNORE
		chip.add_child(fallback)

	if _has_exact_craps_chip_texture(amount):
		return chip

	var label := Label.new()
	label.set_anchors_preset(Control.PRESET_FULL_RECT)
	label.text = _format_craps_chip_amount(amount)
	label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	label.add_theme_font_size_override("font_size", 17)
	label.add_theme_color_override("font_color", Color("#ffffff"))
	_apply_text_depth(label)
	chip.add_child(label)
	return chip


func _refresh_craps_chip_selector() -> void:
	if craps_chip_selector_buttons.is_empty():
		return

	for amount_value in craps_chip_selector_buttons.keys():
		var amount := float(amount_value)
		var button: Button = craps_chip_selector_buttons[amount]
		var selected := is_equal_approx(amount, craps_selected_chip_value)
		var unavailable := amount > craps_credits
		button.set_pressed_no_signal(selected)
		button.disabled = craps_roll_in_progress or unavailable
		button.add_theme_stylebox_override("normal", _craps_selector_chip_style(selected, false))
		button.add_theme_stylebox_override("hover", _craps_selector_chip_style(true, false))
		button.add_theme_stylebox_override("pressed", _craps_selector_chip_style(true, true))
		button.add_theme_stylebox_override("disabled", _craps_selector_chip_style(selected, false, true))
		button.add_theme_color_override("font_color", Color("#101317") if selected else Color("#f6f0df"))
		button.add_theme_color_override("font_hover_color", Color("#101317"))
		button.add_theme_color_override("font_pressed_color", Color("#101317"))
		button.add_theme_color_override("font_disabled_color", Color("#b9c0c9"))


func _format_craps_chip_amount(amount: float) -> String:
	if is_equal_approx(amount, roundf(amount)):
		return "$%d" % int(roundf(amount))
	return "$%.2f" % amount


func _place_craps_dice_at_rest() -> void:
	if craps_roll_in_progress or craps_die_one == null or craps_die_two == null:
		return

	var image_rect := _craps_table_image_rect()
	craps_die_one.position = _map_craps_reference_point(Vector2(560, 545), image_rect) - CRAPS_DICE_DISPLAY_SIZE * 0.5
	craps_die_two.position = _map_craps_reference_point(Vector2(680, 545), image_rect) - CRAPS_DICE_DISPLAY_SIZE * 0.5


func _build_roulette_interface() -> void:
	var top_bar := HBoxContainer.new()
	top_bar.add_theme_constant_override("separation", 10)
	roulette_root.add_child(top_bar)

	var title := Label.new()
	title.text = "Roulette"
	title.add_theme_font_size_override("font_size", 28)
	title.add_theme_color_override("font_color", Color("#f6f0df"))
	title.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	_apply_text_depth(title)
	top_bar.add_child(title)

	roulette_bankroll_label = Label.new()
	roulette_bankroll_label.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	roulette_bankroll_label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	roulette_bankroll_label.add_theme_font_size_override("font_size", 16)
	roulette_bankroll_label.add_theme_color_override("font_color", Color("#cad1df"))
	_apply_text_depth(roulette_bankroll_label)
	top_bar.add_child(roulette_bankroll_label)

	var bet_label := Label.new()
	bet_label.text = "Bet"
	bet_label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	bet_label.add_theme_color_override("font_color", Color("#cad1df"))
	top_bar.add_child(bet_label)

	roulette_bet_spin = SpinBox.new()
	roulette_bet_spin.min_value = 1.0
	roulette_bet_spin.max_value = 500.0
	roulette_bet_spin.step = 1.0
	roulette_bet_spin.value = 10.0
	roulette_bet_spin.custom_minimum_size = Vector2(95, 40)
	top_bar.add_child(roulette_bet_spin)

	roulette_bet_option = OptionButton.new()
	roulette_bet_option.custom_minimum_size = Vector2(210, 40)
	for option in ROULETTE_BET_OPTIONS:
		roulette_bet_option.add_item(str(option["label"]))
		roulette_bet_option.set_item_metadata(roulette_bet_option.item_count - 1, option["id"])
	roulette_bet_option.add_item("Straight 0 pays 35:1")
	roulette_bet_option.set_item_metadata(roulette_bet_option.item_count - 1, "straight_0")
	roulette_bet_option.add_item("Straight 00 pays 35:1")
	roulette_bet_option.set_item_metadata(roulette_bet_option.item_count - 1, "straight_00")
	for number in range(1, 37):
		roulette_bet_option.add_item("Straight %d pays 35:1" % number)
		roulette_bet_option.set_item_metadata(roulette_bet_option.item_count - 1, "straight_%d" % number)
	top_bar.add_child(roulette_bet_option)

	roulette_reset_button = Button.new()
	roulette_reset_button.text = "Reset Credits"
	roulette_reset_button.custom_minimum_size = Vector2(135, 40)
	roulette_reset_button.pressed.connect(_on_roulette_reset_pressed)
	_apply_button_text_depth(roulette_reset_button)
	top_bar.add_child(roulette_reset_button)

	if not SHOW_CASINO_GAME_TABS:
		var exit_button := Button.new()
		exit_button.text = "Exit"
		exit_button.custom_minimum_size = Vector2(100, 40)
		exit_button.pressed.connect(_on_exit_pressed)
		_apply_button_text_depth(exit_button)
		_apply_exit_button_style(exit_button)
		top_bar.add_child(exit_button)

	var body := HSplitContainer.new()
	body.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	body.size_flags_vertical = Control.SIZE_EXPAND_FILL
	body.dragger_visibility = SplitContainer.DRAGGER_VISIBLE
	roulette_root.add_child(body)

	body.add_child(_build_roulette_table_panel())
	body.add_child(_build_roulette_info_panel())


func _build_roulette_table_panel() -> Control:
	var panel := PanelContainer.new()
	panel.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	panel.size_flags_vertical = Control.SIZE_EXPAND_FILL
	panel.add_theme_stylebox_override("panel", _poker_table_style())

	var padding := MarginContainer.new()
	padding.add_theme_constant_override("margin_left", 16)
	padding.add_theme_constant_override("margin_top", 16)
	padding.add_theme_constant_override("margin_right", 16)
	padding.add_theme_constant_override("margin_bottom", 16)
	panel.add_child(padding)

	var layout := VBoxContainer.new()
	layout.add_theme_constant_override("separation", 12)
	padding.add_child(layout)

	roulette_status_label = Label.new()
	roulette_status_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	roulette_status_label.add_theme_font_size_override("font_size", 18)
	roulette_status_label.add_theme_color_override("font_color", Color("#f6f0df"))
	_apply_text_depth(roulette_status_label)
	layout.add_child(roulette_status_label)

	roulette_table_texture = TextureRect.new()
	roulette_table_texture.custom_minimum_size = Vector2(760, 560)
	roulette_table_texture.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	roulette_table_texture.size_flags_vertical = Control.SIZE_EXPAND_FILL
	roulette_table_texture.expand_mode = TextureRect.EXPAND_FIT_WIDTH_PROPORTIONAL
	roulette_table_texture.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
	roulette_table_texture.texture = _load_image_texture(ROULETTE_TABLE_IMAGE)
	layout.add_child(roulette_table_texture)

	var action_row := HBoxContainer.new()
	action_row.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	action_row.add_theme_constant_override("separation", 16)
	layout.add_child(action_row)

	roulette_spin_button = Button.new()
	roulette_spin_button.text = "Spin"
	roulette_spin_button.custom_minimum_size = Vector2(190, 62)
	roulette_spin_button.pressed.connect(_on_roulette_spin_pressed)
	roulette_spin_button.add_theme_font_size_override("font_size", 22)
	_apply_button_text_depth(roulette_spin_button)
	action_row.add_child(roulette_spin_button)

	roulette_tip_label = Label.new()
	roulette_tip_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	roulette_tip_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	roulette_tip_label.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	roulette_tip_label.add_theme_font_size_override("font_size", 22)
	roulette_tip_label.add_theme_color_override("font_color", Color("#c9f3df"))
	_apply_text_depth(roulette_tip_label)
	layout.add_child(roulette_tip_label)

	roulette_result_label = Label.new()
	roulette_result_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	roulette_result_label.add_theme_font_size_override("font_size", 20)
	roulette_result_label.add_theme_color_override("font_color", Color("#f5d067"))
	_apply_text_depth(roulette_result_label)
	layout.add_child(roulette_result_label)

	return panel


func _build_roulette_info_panel() -> Control:
	var panel := PanelContainer.new()
	panel.custom_minimum_size = Vector2(430, 0)
	panel.add_theme_stylebox_override("panel", _panel_style(Color("#20242a")))

	var padding := MarginContainer.new()
	padding.add_theme_constant_override("margin_left", 12)
	padding.add_theme_constant_override("margin_top", 12)
	padding.add_theme_constant_override("margin_right", 12)
	padding.add_theme_constant_override("margin_bottom", 12)
	panel.add_child(padding)

	var layout := VBoxContainer.new()
	layout.add_theme_constant_override("separation", 12)
	padding.add_child(layout)

	var title := Label.new()
	title.text = "Wheel Rail"
	title.add_theme_font_size_override("font_size", 20)
	title.add_theme_color_override("font_color", Color("#f6f0df"))
	_apply_text_depth(title)
	layout.add_child(title)

	roulette_history_label = Label.new()
	roulette_history_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	roulette_history_label.add_theme_color_override("font_color", Color("#cad1df"))
	layout.add_child(roulette_history_label)

	var separator := HSeparator.new()
	layout.add_child(separator)

	var how_to_title := Label.new()
	how_to_title.text = "How To Play"
	how_to_title.add_theme_font_size_override("font_size", 18)
	how_to_title.add_theme_color_override("font_color", Color("#f6f0df"))
	_apply_text_depth(how_to_title)
	layout.add_child(how_to_title)

	var rules_scroll := ScrollContainer.new()
	rules_scroll.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	rules_scroll.size_flags_vertical = Control.SIZE_EXPAND_FILL
	rules_scroll.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
	layout.add_child(rules_scroll)

	var rules := Label.new()
	rules.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	rules.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	rules.add_theme_color_override("font_color", Color("#cad1df"))
	rules.text = _roulette_rules_text()
	rules_scroll.add_child(rules)

	return panel


func _build_slots_interface() -> void:
	var slot_scene: PackedScene = load(SLOT_SCENE_PATH)
	if slot_scene != null:
		var slot_node: Node = slot_scene.instantiate()
		if slot_node is Control:
			slot_node.size_flags_horizontal = Control.SIZE_EXPAND_FILL
			slot_node.size_flags_vertical = Control.SIZE_EXPAND_FILL
		slots_root.add_child(slot_node)
		return

	var message := Label.new()
	message.text = "Slot scene missing: %s" % SLOT_SCENE_PATH
	message.add_theme_font_size_override("font_size", 24)
	message.add_theme_color_override("font_color", Color("#f5d067"))
	_apply_text_depth(message)
	slots_root.add_child(message)


func _configure_stats_wrap_label(label: Label) -> void:
	label.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART


func _build_reset_button(text: String, callback: Callable) -> Button:
	var button := Button.new()
	button.text = text
	button.custom_minimum_size = Vector2(0, 34)
	button.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	button.tooltip_text = "%s without changing card picks." % text
	button.pressed.connect(callback)
	_apply_button_text_depth(button)
	return button


func _on_craps_bet_pressed(key: String) -> void:
	if craps_roll_in_progress:
		return
	if not craps_bets.has(key):
		return
	if craps_point != 0 and (key == "pass" or key == "dont_pass"):
		craps_result_label.text = "Line bets start on the come-out roll. The point is already %d." % craps_point
		return

	var amount := craps_selected_chip_value
	if amount <= 0.0:
		return
	if amount > craps_credits:
		craps_result_label.text = "Not enough credits for a $%.2f chip." % amount
		return

	craps_credits -= amount
	craps_total_wagered += amount
	craps_bets[key] = float(craps_bets[key]) + amount
	craps_result_label.text = "$%.2f pressed onto %s." % [amount, _craps_bet_display_name(key)]
	_refresh_craps()


func _on_craps_chip_selected(amount: float) -> void:
	craps_selected_chip_value = amount
	_refresh_craps_chip_selector()


func _on_craps_roll_pressed() -> void:
	if craps_roll_in_progress:
		return
	if _craps_total_active_bets() <= 0.0:
		craps_result_label.text = "Place a chip on the felt before rolling."
		return

	craps_roll_in_progress = true
	_refresh_craps()

	var die_a := randi_range(1, 6)
	var die_b := randi_range(1, 6)
	await _animate_craps_throw(die_a, die_b)

	_set_craps_dice(die_a, die_b, false)
	_resolve_craps_roll(die_a, die_b)
	craps_roll_in_progress = false
	_refresh_craps()


func _animate_craps_throw(final_die_a: int, final_die_b: int) -> void:
	if craps_table_surface == null or craps_die_one == null or craps_die_two == null:
		for i in 9:
			_set_craps_dice(randi_range(1, 6), randi_range(1, 6), true, i)
			await get_tree().create_timer(0.055 + float(i) * 0.012).timeout
		return

	var image_rect := _craps_table_image_rect()
	var start_a := _map_craps_reference_point(Vector2(-90, 1060), image_rect)
	var start_b := _map_craps_reference_point(Vector2(-120, 1120), image_rect)
	var end_a := _map_craps_reference_point(Vector2(randf_range(500.0, 980.0), randf_range(470.0, 820.0)), image_rect)
	var end_b := _map_craps_reference_point(Vector2(randf_range(620.0, 1100.0), randf_range(520.0, 870.0)), image_rect)
	var bounce_a := _craps_throw_bounce_point(start_a, end_a, image_rect)
	var bounce_b := _craps_throw_bounce_point(start_b, end_b, image_rect)

	craps_die_one.position = start_a - CRAPS_DICE_DISPLAY_SIZE * 0.5
	craps_die_two.position = start_b - CRAPS_DICE_DISPLAY_SIZE * 0.5
	craps_die_one.scale = Vector2(1.1, 1.1)
	craps_die_two.scale = Vector2(1.1, 1.1)

	var tween_a := create_tween()
	tween_a.tween_property(craps_die_one, "position", bounce_a - CRAPS_DICE_DISPLAY_SIZE * 0.5, 0.25).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
	tween_a.tween_property(craps_die_one, "position", end_a - CRAPS_DICE_DISPLAY_SIZE * 0.5, 0.42).set_trans(Tween.TRANS_BOUNCE).set_ease(Tween.EASE_OUT)
	tween_a.parallel().tween_property(craps_die_one, "rotation_degrees", randf_range(260.0, 460.0), 0.67)

	var tween_b := create_tween()
	tween_b.tween_property(craps_die_two, "position", bounce_b - CRAPS_DICE_DISPLAY_SIZE * 0.5, 0.30).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
	tween_b.tween_property(craps_die_two, "position", end_b - CRAPS_DICE_DISPLAY_SIZE * 0.5, 0.38).set_trans(Tween.TRANS_BOUNCE).set_ease(Tween.EASE_OUT)
	tween_b.parallel().tween_property(craps_die_two, "rotation_degrees", randf_range(-460.0, -260.0), 0.68)

	for i in 14:
		_set_craps_dice(randi_range(1, 6), randi_range(1, 6), true, i)
		await get_tree().create_timer(0.045 + float(i) * 0.006).timeout

	_set_craps_dice(final_die_a, final_die_b, false)
	if tween_a.is_running():
		await tween_a.finished
	if tween_b.is_running():
		await tween_b.finished


func _craps_throw_bounce_point(start: Vector2, ending: Vector2, image_rect: Rect2) -> Vector2:
	var should_hit_rail := randf() < 0.45
	if should_hit_rail:
		var rail := randi_range(0, 2)
		match rail:
			0:
				return Vector2(randf_range(image_rect.position.x + image_rect.size.x * 0.18, image_rect.position.x + image_rect.size.x * 0.82), image_rect.position.y + image_rect.size.y * 0.10)
			1:
				return Vector2(image_rect.position.x + image_rect.size.x * 0.12, randf_range(image_rect.position.y + image_rect.size.y * 0.28, image_rect.position.y + image_rect.size.y * 0.72))
			_:
				return Vector2(image_rect.position.x + image_rect.size.x * 0.88, randf_range(image_rect.position.y + image_rect.size.y * 0.28, image_rect.position.y + image_rect.size.y * 0.72))

	return start.lerp(ending, 0.55) + Vector2(randf_range(-90.0, 90.0), randf_range(-80.0, 40.0))


func _on_craps_reset_pressed() -> void:
	craps_credits = CRAPS_STARTING_CREDITS
	craps_point = 0
	craps_rolls_played = 0
	craps_total_wagered = 0.0
	craps_total_paid = 0.0
	craps_roll_history.clear()
	craps_last_roll = [1, 1]
	craps_roll_in_progress = false
	for key in craps_bets.keys():
		craps_bets[key] = 0.0
	craps_result_label.text = "Fresh rail. The dice are yours."
	_set_craps_dice(1, 1, false)
	_refresh_craps()


func _on_roulette_spin_pressed() -> void:
	var bet := float(roulette_bet_spin.value)
	if bet > roulette_credits:
		roulette_result_label.text = "Not enough credits for that bet."
		return

	var bet_id := _roulette_selected_bet_id()
	var pocket := randi_range(-1, 36)
	var is_win := _roulette_bet_wins(bet_id, pocket)
	var payout_multiplier := _roulette_bet_payout_multiplier(bet_id)
	var payout := bet * float(payout_multiplier + 1) if is_win else 0.0
	var net := payout - bet

	roulette_credits -= bet
	roulette_total_wagered += bet
	roulette_spins_played += 1
	roulette_last_pocket = pocket
	if payout > 0.0:
		roulette_credits += payout
		roulette_total_paid += payout

	var pocket_text := _roulette_pocket_text(pocket)
	var color_text := _roulette_pocket_color_name(pocket)
	var bet_text := roulette_bet_option.get_item_text(roulette_bet_option.selected)
	if is_win:
		roulette_result_label.text = "%s %s. %s wins: paid $%.2f, net %s." % [
			pocket_text,
			color_text,
			bet_text,
			payout,
			_format_signed_money(net),
		]
	else:
		roulette_result_label.text = "%s %s. %s loses $%.2f." % [
			pocket_text,
			color_text,
			bet_text,
			bet,
		]

	roulette_spin_history.push_front(
		"Spin %d: %s %s | %s | %s" % [
			roulette_spins_played,
			pocket_text,
			color_text,
			bet_text,
			_format_signed_money(net),
		]
	)
	while roulette_spin_history.size() > 12:
		roulette_spin_history.pop_back()

	_refresh_roulette()


func _on_roulette_reset_pressed() -> void:
	roulette_credits = ROULETTE_STARTING_CREDITS
	roulette_spins_played = 0
	roulette_total_wagered = 0.0
	roulette_total_paid = 0.0
	roulette_last_pocket = 0
	roulette_spin_history.clear()
	roulette_result_label.text = "Credits reset. Choose a bet and spin."
	_refresh_roulette()


func _on_poker_deal_pressed() -> void:
	if poker_waiting_for_draw:
		poker_result_label.text = "Draw this hand before dealing again."
		return

	var bet := float(poker_bet_spin.value)
	if bet > poker_credits:
		poker_result_label.text = "Not enough credits for that bet."
		return

	poker_credits -= bet
	poker_total_wagered += bet
	poker_hands_played += 1
	poker_deck = _build_poker_deck()
	poker_deck.shuffle()
	poker_cards.clear()
	poker_hold.clear()
	for i in POKER_HAND_SIZE:
		poker_cards.append(_draw_poker_card())
		poker_hold.append(false)

	poker_waiting_for_draw = true
	poker_result_label.text = "Choose holds, then draw."
	_refresh_poker()


func _on_poker_draw_pressed() -> void:
	if not poker_waiting_for_draw:
		return

	for i in POKER_HAND_SIZE:
		if not bool(poker_hold[i]):
			poker_cards[i] = _draw_poker_card()

	var result := _evaluate_poker_hand(poker_cards)
	var bet := float(poker_bet_spin.value)
	var multiplier := int(result["multiplier"])
	var payout := bet * float(multiplier)
	poker_credits += payout
	poker_total_paid += payout
	poker_waiting_for_draw = false

	if payout > 0.0:
		poker_result_label.text = "%s pays %.0fx: +$%.2f" % [str(result["hand"]), multiplier, payout]
	else:
		poker_result_label.text = "%s. No payout." % str(result["hand"])

	_refresh_poker()


func _on_poker_card_pressed(index: int) -> void:
	if not poker_waiting_for_draw or index < 0 or index >= poker_hold.size():
		return

	poker_hold[index] = not bool(poker_hold[index])
	_refresh_poker()


func _on_poker_reset_pressed() -> void:
	poker_credits = POKER_STARTING_CREDITS
	poker_hands_played = 0
	poker_total_wagered = 0.0
	poker_total_paid = 0.0
	poker_waiting_for_draw = false
	poker_cards.clear()
	poker_hold.clear()
	poker_result_label.text = "Credits reset."
	_refresh_poker()


func _on_pai_gow_deal_pressed() -> void:
	if pai_gow_in_round:
		pai_gow_result_label.text = "Set this hand before dealing again."
		return

	var bet := float(pai_gow_bet_spin.value)
	if bet > pai_gow_credits:
		pai_gow_result_label.text = "Not enough credits for that bet."
		return

	pai_gow_credits -= bet
	pai_gow_current_bet = bet
	pai_gow_total_wagered += bet
	pai_gow_hands_played += 1
	pai_gow_deck = _build_poker_deck()
	pai_gow_deck.shuffle()
	pai_gow_player_cards.clear()
	pai_gow_dealer_cards.clear()
	pai_gow_low_indices.clear()
	pai_gow_in_round = true
	pai_gow_reveal_dealer = false

	for i in 7:
		pai_gow_player_cards.append(_draw_pai_gow_card())
		pai_gow_dealer_cards.append(_draw_pai_gow_card())

	pai_gow_result_label.text = "Choose two cards for the Low hand, then set your hands."
	_refresh_pai_gow()


func _on_pai_gow_house_way_pressed() -> void:
	if not pai_gow_in_round:
		return

	pai_gow_low_indices = _pai_gow_house_way_low_indices(pai_gow_player_cards)
	pai_gow_result_label.text = "House Way selected. Set hands when ready."
	_refresh_pai_gow()


func _on_pai_gow_card_pressed(index: int) -> void:
	if not pai_gow_in_round or index < 0 or index >= pai_gow_player_cards.size():
		return

	if pai_gow_low_indices.has(index):
		pai_gow_low_indices.erase(index)
	elif pai_gow_low_indices.size() < 2:
		pai_gow_low_indices.append(index)
		pai_gow_low_indices.sort()
	else:
		pai_gow_result_label.text = "Low hand already has two cards. Unselect one first."
	_refresh_pai_gow()


func _on_pai_gow_set_pressed() -> void:
	if not pai_gow_in_round:
		return
	if pai_gow_low_indices.size() != 2:
		pai_gow_result_label.text = "Choose exactly two cards for the Low hand."
		return

	var player_split := _pai_gow_split_from_indices(pai_gow_player_cards, pai_gow_low_indices)
	if _pai_gow_split_is_foul(player_split):
		pai_gow_result_label.text = "Foul hand: your five-card High must outrank your two-card Low."
		_refresh_pai_gow()
		return

	var dealer_low_indices := _pai_gow_house_way_low_indices(pai_gow_dealer_cards)
	var dealer_split := _pai_gow_split_from_indices(pai_gow_dealer_cards, dealer_low_indices)
	var low_compare := _compare_pai_gow_evals(
		_pai_gow_evaluate_two_card(player_split["low"]),
		_pai_gow_evaluate_two_card(dealer_split["low"])
	)
	var high_compare := _compare_pai_gow_evals(
		_pai_gow_evaluate_five_card(player_split["high"]),
		_pai_gow_evaluate_five_card(dealer_split["high"])
	)

	var player_units := 0
	var banker_units := 0
	for compare in [low_compare, high_compare]:
		if int(compare) > 0:
			player_units += 1
		else:
			banker_units += 1

	var payout := 0.0
	var message := ""
	if player_units == 2:
		payout = pai_gow_current_bet * 2.0
		message = "You win both hands."
	elif banker_units == 2:
		message = "Dealer wins both hands."
	else:
		payout = pai_gow_current_bet
		message = "Push. One side wins each hand."

	pai_gow_credits += payout
	pai_gow_total_paid += payout
	pai_gow_in_round = false
	pai_gow_reveal_dealer = true
	pai_gow_result_label.text = "%s Paid $%.2f." % [message, payout]
	_refresh_pai_gow()


func _on_pai_gow_reset_pressed() -> void:
	pai_gow_credits = PAI_GOW_STARTING_CREDITS
	pai_gow_current_bet = 0.0
	pai_gow_hands_played = 0
	pai_gow_total_wagered = 0.0
	pai_gow_total_paid = 0.0
	pai_gow_in_round = false
	pai_gow_reveal_dealer = false
	pai_gow_deck.clear()
	pai_gow_player_cards.clear()
	pai_gow_dealer_cards.clear()
	pai_gow_low_indices.clear()
	pai_gow_result_label.text = "Credits reset."
	_refresh_pai_gow()


func _on_blackjack_deal_pressed() -> void:
	if blackjack_in_round:
		return

	var bet := float(blackjack_bet_spin.value)
	if bet > blackjack_credits:
		blackjack_result_label.text = "Not enough credits for that bet."
		return

	blackjack_credits -= bet
	blackjack_current_bet = bet
	blackjack_total_wagered += bet
	blackjack_hands_played += 1
	blackjack_deck = _build_poker_deck()
	blackjack_deck.shuffle()
	blackjack_dealer_cards.clear()
	blackjack_player_cards.clear()
	blackjack_round_over = false
	blackjack_in_round = true

	blackjack_player_cards.append(_draw_blackjack_card())
	blackjack_dealer_cards.append(_draw_blackjack_card())
	blackjack_player_cards.append(_draw_blackjack_card())
	blackjack_dealer_cards.append(_draw_blackjack_card())

	var player_blackjack := _is_blackjack(blackjack_player_cards)
	var dealer_blackjack := _is_blackjack(blackjack_dealer_cards)
	if player_blackjack and dealer_blackjack:
		_finish_blackjack_round("Both have blackjack. Push.", bet)
	elif player_blackjack:
		_finish_blackjack_round("Blackjack pays 3:2.", bet * 2.5)
	elif dealer_blackjack:
		_finish_blackjack_round("Dealer has blackjack.", 0.0)
	else:
		blackjack_result_label.text = "Choose Hit or Stand."
		_refresh_blackjack()


func _on_blackjack_hit_pressed() -> void:
	if not blackjack_in_round:
		return

	blackjack_player_cards.append(_draw_blackjack_card())
	var total := int(_blackjack_hand_value(blackjack_player_cards)["total"])
	if total > 21:
		_finish_blackjack_round("Bust. Dealer wins.", 0.0)
	else:
		blackjack_result_label.text = "Hit or Stand."
		_refresh_blackjack()


func _on_blackjack_stand_pressed() -> void:
	if not blackjack_in_round:
		return

	while int(_blackjack_hand_value(blackjack_dealer_cards)["total"]) < 17:
		blackjack_dealer_cards.append(_draw_blackjack_card())

	var player_total := int(_blackjack_hand_value(blackjack_player_cards)["total"])
	var dealer_total := int(_blackjack_hand_value(blackjack_dealer_cards)["total"])
	if dealer_total > 21:
		_finish_blackjack_round("Dealer busts. You win.", blackjack_current_bet * 2.0)
	elif player_total > dealer_total:
		_finish_blackjack_round("You beat the dealer.", blackjack_current_bet * 2.0)
	elif player_total == dealer_total:
		_finish_blackjack_round("Push. Bet returned.", blackjack_current_bet)
	else:
		_finish_blackjack_round("Dealer wins.", 0.0)


func _on_blackjack_reset_pressed() -> void:
	blackjack_credits = BLACKJACK_STARTING_CREDITS
	blackjack_current_bet = 0.0
	blackjack_hands_played = 0
	blackjack_total_wagered = 0.0
	blackjack_total_paid = 0.0
	blackjack_in_round = false
	blackjack_round_over = false
	blackjack_deck.clear()
	blackjack_dealer_cards.clear()
	blackjack_player_cards.clear()
	blackjack_result_label.text = "Credits reset."
	_refresh_blackjack()


func _on_three_card_deal_pressed() -> void:
	if three_card_in_round:
		return

	var ante := float(three_card_ante_spin.value)
	var pair_plus := float(three_card_pair_plus_spin.value)
	var wager := ante + pair_plus
	if wager > three_card_credits:
		three_card_result_label.text = "Not enough credits for that bet."
		return

	three_card_credits -= wager
	three_card_current_ante = ante
	three_card_current_pair_plus = pair_plus
	three_card_total_wagered += wager
	three_card_hands_played += 1
	three_card_deck = _build_poker_deck()
	three_card_deck.shuffle()
	three_card_dealer_cards.clear()
	three_card_player_cards.clear()
	three_card_in_round = true
	three_card_reveal_dealer = false

	for i in 3:
		three_card_player_cards.append(_draw_three_card())
		three_card_dealer_cards.append(_draw_three_card())

	var player_eval := _evaluate_three_card_hand(three_card_player_cards)
	three_card_result_label.text = "Your hand: %s. Play or Fold." % str(player_eval["name"])
	_refresh_three_card()


func _on_three_card_play_pressed() -> void:
	if not three_card_in_round:
		return

	var play_bet := three_card_current_ante
	if play_bet > three_card_credits:
		three_card_result_label.text = "Not enough credits to make the Play bet."
		return

	three_card_credits -= play_bet
	three_card_total_wagered += play_bet
	three_card_reveal_dealer = true

	var player_eval := _evaluate_three_card_hand(three_card_player_cards)
	var dealer_eval := _evaluate_three_card_hand(three_card_dealer_cards)
	var pair_plus_paid := _three_card_pair_plus_payout(player_eval)
	var ante_bonus := _three_card_ante_bonus(player_eval)
	var dealer_qualifies := _three_card_dealer_qualifies(dealer_eval)
	var ante := three_card_current_ante
	var payout := pair_plus_paid + ante_bonus
	var message := ""

	if not dealer_qualifies:
		payout += ante * 2.0 + play_bet
		message = "Dealer does not qualify. Ante wins, Play pushes."
	else:
		var compare := _compare_three_card_hands(player_eval, dealer_eval)
		if compare > 0:
			payout += ante * 2.0 + play_bet * 2.0
			message = "You win with %s." % str(player_eval["name"])
		elif compare == 0:
			payout += ante + play_bet
			message = "Push. Both hands tie."
		else:
			message = "Dealer wins with %s." % str(dealer_eval["name"])

	_finish_three_card_round("%s Pair Plus/bonus paid $%.2f." % [message, pair_plus_paid + ante_bonus], payout)


func _on_three_card_fold_pressed() -> void:
	if not three_card_in_round:
		return

	three_card_reveal_dealer = true
	var player_eval := _evaluate_three_card_hand(three_card_player_cards)
	var pair_plus_paid := _three_card_pair_plus_payout(player_eval)
	_finish_three_card_round("Folded. Ante lost. Pair Plus paid $%.2f." % pair_plus_paid, pair_plus_paid)


func _on_three_card_reset_pressed() -> void:
	three_card_credits = THREE_CARD_STARTING_CREDITS
	three_card_current_ante = 0.0
	three_card_current_pair_plus = 0.0
	three_card_hands_played = 0
	three_card_total_wagered = 0.0
	three_card_total_paid = 0.0
	three_card_in_round = false
	three_card_reveal_dealer = false
	three_card_deck.clear()
	three_card_dealer_cards.clear()
	three_card_player_cards.clear()
	three_card_result_label.text = "Credits reset."
	_refresh_three_card()


func _on_baccarat_deal_pressed() -> void:
	var bet := float(baccarat_bet_spin.value)
	if bet > baccarat_credits:
		baccarat_result_label.text = "Not enough credits for that bet."
		return

	baccarat_last_bet_side = BACCARAT_BET_OPTIONS[baccarat_bet_option.selected]
	baccarat_credits -= bet
	baccarat_total_wagered += bet
	baccarat_hands_played += 1
	baccarat_deck = _build_poker_deck()
	baccarat_deck.shuffle()
	baccarat_player_cards.clear()
	baccarat_banker_cards.clear()

	baccarat_player_cards.append(_draw_baccarat_card())
	baccarat_banker_cards.append(_draw_baccarat_card())
	baccarat_player_cards.append(_draw_baccarat_card())
	baccarat_banker_cards.append(_draw_baccarat_card())
	_apply_baccarat_draw_rules()

	var player_total := _baccarat_total(baccarat_player_cards)
	var banker_total := _baccarat_total(baccarat_banker_cards)
	var winner := "Tie"
	if player_total > banker_total:
		winner = "Player"
	elif banker_total > player_total:
		winner = "Banker"

	var payout := _baccarat_payout(bet, baccarat_last_bet_side, winner)
	baccarat_credits += payout
	baccarat_total_paid += payout
	baccarat_result_label.text = "%s wins %d-%d. Bet: %s. Paid $%.2f." % [
		winner,
		player_total,
		banker_total,
		baccarat_last_bet_side,
		payout,
	]
	_refresh_baccarat()


func _on_baccarat_reset_pressed() -> void:
	baccarat_credits = BACCARAT_STARTING_CREDITS
	baccarat_hands_played = 0
	baccarat_total_wagered = 0.0
	baccarat_total_paid = 0.0
	baccarat_player_cards.clear()
	baccarat_banker_cards.clear()
	baccarat_deck.clear()
	baccarat_result_label.text = "Credits reset."
	_refresh_baccarat()


func _on_card_pressed(index: int) -> void:
	selected_card = index
	reveal_all_card_numbers = false
	_refresh_all()


func _on_number_pressed(number: int) -> void:
	reveal_all_card_numbers = false
	var picks: Array = card_picks[selected_card]
	if picks.has(number):
		picks.erase(number)
	elif picks.size() < MAX_PICKS_PER_CARD:
		picks.append(number)
		picks.sort()
	else:
		result_label.text = "Card %s already has %d picks. Clear one first." % [_card_label(selected_card), MAX_PICKS_PER_CARD]
		return
	_refresh_all()


func _on_play_pressed() -> void:
	var active_cards := _get_active_cards()
	if active_cards.is_empty():
		result_label.text = "Pick at least one number on a card before playing."
		return

	last_draw = _draw_numbers()
	rounds_played += 1
	for number in last_draw:
		number_hit_counts[number] += 1

	var bet := float(bet_spin.value)
	var round_wager := bet * active_cards.size()
	var round_paid := 0.0
	var round_hits := 0
	var result_lines := []

	for card_index in active_cards:
		var picks: Array = card_picks[card_index]
		var matches := _count_matches(picks, last_draw)
		var multiplier := _get_payout_multiplier(picks.size(), matches)
		var payout := bet * multiplier
		card_plays[card_index] += 1
		card_profit[card_index] += payout - bet
		if payout > bet:
			card_wins[card_index] += 1
		_record_hit_tally(picks.size(), matches)
		round_paid += payout
		round_hits += matches
		result_lines.append("%s %d/%d hits pays %.0fx" % [_card_label(card_index), matches, picks.size(), multiplier])

	total_wagered += round_wager
	total_paid += round_paid
	if round_paid > round_wager:
		winning_rounds += 1
	else:
		losing_rounds += 1

	_record_recent_run(rounds_played, active_cards.size(), round_hits, round_paid, round_wager)
	reveal_all_card_numbers = true

	result_label.text = "Round %d: wager $%.2f, paid $%.2f, net $%.2f\n%s" % [
		rounds_played,
		round_wager,
		round_paid,
		round_paid - round_wager,
		", ".join(result_lines),
	]
	_refresh_all()
	_animate_keno_balls()


func _on_auto_play_toggled(playing: bool) -> void:
	if playing and _get_active_cards().is_empty():
		result_label.text = "Pick at least one number on a card before starting Auto Play."
		auto_play_button.set_pressed_no_signal(false)
		_refresh_auto_play_button(false)
		return

	if playing:
		auto_play_timer.start()
	else:
		auto_play_timer.stop()

	_refresh_auto_play_button(playing)


func _on_auto_play_timeout() -> void:
	if keno_ball_animating:
		return

	if _get_active_cards().is_empty():
		auto_play_timer.stop()
		auto_play_button.set_pressed_no_signal(false)
		_refresh_auto_play_button(false)
		result_label.text = "Auto Play stopped because no cards have picks."
		_refresh_all()
		return

	_on_play_pressed()


func _on_quick_pick_all_pressed() -> void:
	reveal_all_card_numbers = false
	var quick_count := _get_quick_pick_count()
	for i in CARD_COUNT:
		card_picks[i] = _draw_unique(quick_count, NUMBER_MAX)
	_refresh_all()


func _on_quick_pick_card_pressed() -> void:
	reveal_all_card_numbers = false
	card_picks[selected_card] = _draw_unique(_get_quick_pick_count(), NUMBER_MAX)
	_refresh_all()


func _on_use_hot_picks_pressed() -> void:
	reveal_all_card_numbers = false
	var picks := _draw_unique(MAX_PICKS_PER_CARD, NUMBER_MAX)
	if rounds_played > 0:
		picks = _get_hot_numbers(MAX_PICKS_PER_CARD)
	card_picks[selected_card] = picks
	_refresh_all()


func _on_clear_card_pressed() -> void:
	reveal_all_card_numbers = false
	card_picks[selected_card].clear()
	_refresh_all()


func _on_clear_all_pressed() -> void:
	reveal_all_card_numbers = false
	for picks in card_picks:
		picks.clear()
	_refresh_all()


func _on_reset_all_time_pressed() -> void:
	_reset_all_time_counters()
	_reset_hit_tally()
	result_label.text = "All-time round and money counters reset."
	_refresh_all()


func _on_reset_recent_runs_pressed() -> void:
	recent_runs.clear()
	result_label.text = "Last 100 run tally reset."
	_refresh_all()


func _on_reset_number_hits_pressed() -> void:
	_reset_number_hit_counters()
	_reset_hit_tally()
	result_label.text = "Hit counters reset."
	_refresh_all()


func _on_reset_selected_card_pressed() -> void:
	_reset_card_counters(selected_card)
	result_label.text = "Card %s counters reset." % _card_label(selected_card)
	_refresh_all()


func _on_reset_all_cards_pressed() -> void:
	_reset_all_card_counters()
	result_label.text = "All card counters reset."
	_refresh_all()


func _on_reset_all_counters_pressed() -> void:
	_reset_all_time_counters()
	_reset_all_card_counters()
	_reset_number_hit_counters()
	_reset_hit_tally()
	recent_runs.clear()
	result_label.text = "All counters reset. Card picks were kept."
	_refresh_all()


func _refresh_all() -> void:
	_refresh_cards()
	_refresh_numbers()
	_refresh_labels()


func _refresh_poker() -> void:
	if poker_bankroll_label == null:
		return

	var net := poker_total_paid - poker_total_wagered
	poker_bankroll_label.text = "Credits: $%.2f  |  Hands: %d  |  Net: %s" % [
		poker_credits,
		poker_hands_played,
		_format_signed_money(net),
	]

	poker_deal_button.disabled = poker_waiting_for_draw
	poker_draw_button.disabled = not poker_waiting_for_draw
	poker_bet_spin.editable = not poker_waiting_for_draw
	_refresh_poker_action_button_styles()

	if poker_cards.is_empty():
		poker_status_label.text = "Deal a five-card poker hand."
	else:
		poker_status_label.text = "Held cards stay. Unheld cards draw fresh." if poker_waiting_for_draw else "Hand complete. Deal again when ready."

	var tip := _get_poker_strategy_tip(poker_cards) if poker_waiting_for_draw else {}
	var suggested_holds: Array = tip.get("holds", [])
	if poker_tip_label != null:
		if poker_waiting_for_draw and not tip.is_empty():
			poker_tip_label.text = str(tip["text"])
		elif poker_cards.is_empty():
			poker_tip_label.text = "Tip: deal a hand to get a hold suggestion."
		else:
			poker_tip_label.text = "Tip: deal again for the next hand suggestion."

	for i in poker_card_buttons.size():
		var button: Button = poker_card_buttons[i]
		var has_card := i < poker_cards.size()
		button.disabled = not has_card
		button.pivot_offset = button.size * 0.5
		button.rotation_degrees = POKER_CARD_ROTATIONS[i] if i < POKER_CARD_ROTATIONS.size() else 0.0
		button.scale = Vector2(1.0, 1.0)
		if has_card:
			var card: Dictionary = poker_cards[i]
			var held := bool(poker_hold[i])
			var texture := _get_poker_card_texture(card)
			var suit_color := _poker_suit_color(str(card["suit"]))
			var bg := Color("#f7f1e7") if not held else Color("#ffdc74")
			var border := suit_color if not held else Color("#fff7c9")
			var suggested := suggested_holds.has(i)
			if suggested and not held:
				border = Color("#69e3ff")
			if held:
				button.scale = Vector2(1.035, 1.035)
			if texture != null:
				button.icon = texture
				button.text = ""
			else:
				button.icon = null
				button.text = "%s\n%s" % [_rank_label(int(card["rank"])), str(card["suit"])]
			button.tooltip_text = "%s of %s%s" % [
				_rank_label(int(card["rank"])),
				_poker_suit_name(str(card["suit"])),
				" held" if held else "",
			]
			button.add_theme_stylebox_override("normal", _poker_card_style(bg, border, 4 if suggested or held else 2, held or suggested))
			button.add_theme_stylebox_override("hover", _poker_card_style(bg.lightened(0.04), Color("#ffffff"), 4, true))
			button.add_theme_stylebox_override("pressed", _poker_card_style(bg.darkened(0.04), Color("#ffffff"), 4, true, true))
			button.add_theme_color_override("font_color", suit_color)
			button.add_theme_font_size_override("font_size", 34)
		else:
			button.icon = null
			button.text = "CARD\n%d" % (i + 1)
			button.tooltip_text = "Empty card slot"
			button.add_theme_stylebox_override("normal", _poker_card_style(Color("#25352f"), Color("#4a5f55"), 2, false))
			button.add_theme_stylebox_override("hover", _poker_card_style(Color("#2d4038"), Color("#f6f0df"), 3, false))
			button.add_theme_stylebox_override("pressed", _poker_card_style(Color("#2d4038"), Color("#ffffff"), 3, false, true))
			button.add_theme_color_override("font_color", Color("#cad1df"))
			button.add_theme_font_size_override("font_size", 22)
		_apply_button_text_depth(button)

	poker_paytable_label.text = _format_poker_paytable()


func _refresh_poker_action_button_styles() -> void:
	if poker_deal_button == null or poker_draw_button == null:
		return

	_apply_poker_action_button_style(poker_deal_button, not poker_deal_button.disabled, Color("#2f8f5b"))
	_apply_poker_action_button_style(poker_draw_button, not poker_draw_button.disabled, Color("#336b9d"))


func _apply_poker_action_button_style(button: Button, active: bool, color: Color) -> void:
	var bg := color if active else Color("#2a3038")
	var border := Color("#f6f0df") if active else Color("#3b4450")
	button.add_theme_stylebox_override("normal", _poker_action_button_style(bg, border, active))
	button.add_theme_stylebox_override("hover", _poker_action_button_style(bg.lightened(0.08), Color("#ffffff"), active))
	button.add_theme_stylebox_override("pressed", _poker_action_button_style(bg.darkened(0.08), Color("#ffffff"), active, true))
	button.add_theme_color_override("font_color", Color("#ffffff") if active else Color("#8f98a8"))


func _refresh_pai_gow() -> void:
	if pai_gow_bankroll_label == null:
		return

	var net := pai_gow_total_paid - pai_gow_total_wagered
	pai_gow_bankroll_label.text = "Credits: $%.2f  |  Hands: %d  |  Net: %s" % [
		pai_gow_credits,
		pai_gow_hands_played,
		_format_signed_money(net),
	]

	pai_gow_deal_button.disabled = pai_gow_in_round
	pai_gow_house_way_button.disabled = not pai_gow_in_round
	pai_gow_set_button.disabled = not pai_gow_in_round or pai_gow_low_indices.size() != 2
	pai_gow_bet_spin.editable = not pai_gow_in_round
	_apply_poker_action_button_style(pai_gow_deal_button, not pai_gow_deal_button.disabled, Color("#2f8f5b"))
	_apply_poker_action_button_style(pai_gow_house_way_button, not pai_gow_house_way_button.disabled, Color("#9d6b33"))
	_apply_poker_action_button_style(pai_gow_set_button, not pai_gow_set_button.disabled, Color("#336b9d"))

	if pai_gow_player_cards.is_empty():
		pai_gow_status_label.text = "Deal seven cards, then set a two-card Low hand."
		pai_gow_tip_label.text = "Tip: House Way will make a balanced automatic split."
		pai_gow_player_low_label.text = "Player Low"
		pai_gow_player_high_label.text = "Player High"
		pai_gow_dealer_low_label.text = "Dealer Low"
		pai_gow_dealer_high_label.text = "Dealer High"
	else:
		pai_gow_status_label.text = "Click two cards for Low. The other five become High." if pai_gow_in_round else "Hand complete. Deal again when ready."
		pai_gow_tip_label.text = _pai_gow_tip_text()

	var player_split := _pai_gow_split_from_indices(pai_gow_player_cards, pai_gow_low_indices)
	var dealer_split := {}
	if pai_gow_reveal_dealer and not pai_gow_dealer_cards.is_empty():
		dealer_split = _pai_gow_split_from_indices(pai_gow_dealer_cards, _pai_gow_house_way_low_indices(pai_gow_dealer_cards))

	if not player_split.is_empty():
		pai_gow_player_low_label.text = "Player Low: %s" % _pai_gow_eval_name(_pai_gow_evaluate_two_card(player_split["low"]))
		pai_gow_player_high_label.text = "Player High: %s" % _pai_gow_eval_name(_pai_gow_evaluate_five_card(player_split["high"]))
	else:
		pai_gow_player_low_label.text = "Player Low: choose 2 cards"
		pai_gow_player_high_label.text = "Player High: remaining 5 cards"

	if dealer_split.is_empty():
		pai_gow_dealer_low_label.text = "Dealer Low: hidden"
		pai_gow_dealer_high_label.text = "Dealer High: hidden"
	else:
		pai_gow_dealer_low_label.text = "Dealer Low: %s" % _pai_gow_eval_name(_pai_gow_evaluate_two_card(dealer_split["low"]))
		pai_gow_dealer_high_label.text = "Dealer High: %s" % _pai_gow_eval_name(_pai_gow_evaluate_five_card(dealer_split["high"]))

	_refresh_pai_gow_selection_row()
	_refresh_pai_gow_split_row(pai_gow_player_low_row, player_split.get("low", []), false)
	_refresh_pai_gow_split_row(pai_gow_player_high_row, player_split.get("high", []), false)
	_refresh_pai_gow_split_row(pai_gow_dealer_low_row, dealer_split.get("low", []), not pai_gow_reveal_dealer)
	_refresh_pai_gow_split_row(pai_gow_dealer_high_row, dealer_split.get("high", []), not pai_gow_reveal_dealer)


func _refresh_pai_gow_selection_row() -> void:
	for child in pai_gow_selection_row.get_children():
		pai_gow_selection_row.remove_child(child)
		child.queue_free()

	if pai_gow_player_cards.is_empty():
		pai_gow_selection_row.add_child(_build_pai_gow_placeholder_card("PAI GOW"))
		return

	for i in pai_gow_player_cards.size():
		pai_gow_selection_row.add_child(_build_pai_gow_card_button(pai_gow_player_cards[i], i, pai_gow_low_indices.has(i), pai_gow_in_round))


func _refresh_pai_gow_split_row(row: HBoxContainer, cards: Array, hidden: bool) -> void:
	for child in row.get_children():
		row.remove_child(child)
		child.queue_free()

	if cards.is_empty():
		row.add_child(_build_pai_gow_placeholder_card("HIDDEN" if hidden else "WAITING"))
		return

	for i in cards.size():
		row.add_child(_build_pai_gow_card_button(cards[i], i, false, false, hidden))


func _build_pai_gow_card_button(card: Dictionary, index: int, selected: bool, selectable: bool, hidden := false) -> Button:
	var button := Button.new()
	button.custom_minimum_size = PAI_GOW_CARD_DISPLAY_SIZE
	button.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	button.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	button.disabled = not selectable
	button.expand_icon = true
	button.icon_alignment = HORIZONTAL_ALIGNMENT_CENTER
	button.vertical_icon_alignment = VERTICAL_ALIGNMENT_CENTER
	button.pivot_offset = PAI_GOW_CARD_DISPLAY_SIZE * 0.5
	button.rotation_degrees = PAI_GOW_CARD_ROTATIONS[index] if index < PAI_GOW_CARD_ROTATIONS.size() else 0.0
	if selectable:
		button.pressed.connect(_on_pai_gow_card_pressed.bind(index))

	if hidden:
		button.text = "?"
		button.icon = null
		button.tooltip_text = "Dealer card"
		button.add_theme_font_size_override("font_size", 42)
		button.add_theme_color_override("font_color", Color("#f6f0df"))
		button.add_theme_stylebox_override("normal", _poker_card_style(Color("#26314a"), Color("#6576b4"), 3, true))
	else:
		var texture := _get_poker_card_texture(card)
		if texture != null:
			button.icon = texture
			button.text = ""
		else:
			button.text = "%s\n%s" % [_rank_label(int(card["rank"])), str(card["suit"])]
		button.tooltip_text = "%s of %s%s" % [
			_rank_label(int(card["rank"])),
			_poker_suit_name(str(card["suit"])),
			" in Low" if selected else "",
		]
		var bg := Color("#ffdc74") if selected else Color("#f7f1e7")
		var border := Color("#fff7c9") if selected else _poker_suit_color(str(card["suit"]))
		button.add_theme_color_override("font_color", _poker_suit_color(str(card["suit"])))
		button.add_theme_font_size_override("font_size", 24)
		button.add_theme_stylebox_override("normal", _poker_card_style(bg, border, 4 if selected else 2, selected))
		button.add_theme_stylebox_override("hover", _poker_card_style(bg.lightened(0.04), Color("#ffffff"), 4, true))
		button.add_theme_stylebox_override("pressed", _poker_card_style(bg.darkened(0.04), Color("#ffffff"), 4, true, true))
	_apply_button_text_depth(button)
	return button


func _build_pai_gow_placeholder_card(text: String) -> Button:
	var button := Button.new()
	button.custom_minimum_size = PAI_GOW_CARD_DISPLAY_SIZE
	button.disabled = true
	button.text = text
	button.add_theme_font_size_override("font_size", 18)
	button.add_theme_color_override("font_color", Color("#cad1df"))
	button.add_theme_stylebox_override("normal", _poker_card_style(Color("#25352f"), Color("#4a5f55"), 2, false))
	_apply_button_text_depth(button)
	return button


func _refresh_blackjack() -> void:
	if blackjack_bankroll_label == null:
		return

	var net := blackjack_total_paid - blackjack_total_wagered
	blackjack_bankroll_label.text = "Credits: $%.2f  |  Hands: %d  |  Net: %s" % [
		blackjack_credits,
		blackjack_hands_played,
		_format_signed_money(net),
	]

	blackjack_deal_button.disabled = blackjack_in_round
	blackjack_hit_button.disabled = not blackjack_in_round
	blackjack_stand_button.disabled = not blackjack_in_round
	blackjack_bet_spin.editable = not blackjack_in_round
	_refresh_blackjack_action_button_styles()

	if blackjack_player_cards.is_empty():
		blackjack_status_label.text = "Deal a Blackjack hand."
	else:
		blackjack_status_label.text = "Dealer stands on 17. Blackjack pays 3:2." if blackjack_in_round else "Hand complete. Deal again when ready."

	blackjack_dealer_total_label.text = _blackjack_dealer_total_text()
	blackjack_player_total_label.text = _blackjack_hand_total_text("Player", blackjack_player_cards)
	blackjack_tip_label.text = _get_blackjack_strategy_tip()
	_refresh_blackjack_card_row(blackjack_dealer_row, blackjack_dealer_cards, blackjack_in_round, true)
	_refresh_blackjack_card_row(blackjack_player_row, blackjack_player_cards, false, false)


func _refresh_blackjack_card_row(row: HBoxContainer, cards: Array, hide_second_card: bool, dealer: bool) -> void:
	for child in row.get_children():
		row.remove_child(child)
		child.queue_free()

	if cards.is_empty():
		row.add_child(_build_blackjack_placeholder_card("DEALER" if dealer else "PLAYER"))
		return

	for i in cards.size():
		row.add_child(_build_blackjack_card_button(cards[i], hide_second_card and i == 1, i))


func _build_blackjack_card_button(card: Dictionary, hidden: bool, index: int) -> Button:
	var button := Button.new()
	button.custom_minimum_size = BLACKJACK_CARD_DISPLAY_SIZE
	button.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	button.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	button.disabled = true
	button.expand_icon = true
	button.icon_alignment = HORIZONTAL_ALIGNMENT_CENTER
	button.vertical_icon_alignment = VERTICAL_ALIGNMENT_CENTER
	button.pivot_offset = BLACKJACK_CARD_DISPLAY_SIZE * 0.5
	button.rotation_degrees = BLACKJACK_CARD_ROTATIONS[index] if index < BLACKJACK_CARD_ROTATIONS.size() else 0.0
	if hidden:
		button.icon = null
		button.text = "?"
		button.tooltip_text = "Dealer hole card"
		button.add_theme_font_size_override("font_size", 42)
		button.add_theme_color_override("font_color", Color("#f6f0df"))
		button.add_theme_stylebox_override("normal", _poker_card_style(Color("#26314a"), Color("#6576b4"), 3, true))
	else:
		var texture := _get_poker_card_texture(card)
		if texture != null:
			button.icon = texture
			button.text = ""
		else:
			button.text = "%s\n%s" % [_rank_label(int(card["rank"])), str(card["suit"])]
		button.tooltip_text = "%s of %s" % [_rank_label(int(card["rank"])), _poker_suit_name(str(card["suit"]))]
		button.add_theme_color_override("font_color", _poker_suit_color(str(card["suit"])))
		button.add_theme_font_size_override("font_size", 28)
		button.add_theme_stylebox_override("normal", _poker_card_style(Color("#f7f1e7"), _poker_suit_color(str(card["suit"])), 2, false))
	_apply_button_text_depth(button)
	return button


func _build_blackjack_placeholder_card(text: String) -> Button:
	var button := Button.new()
	button.custom_minimum_size = BLACKJACK_CARD_DISPLAY_SIZE
	button.disabled = true
	button.text = text
	button.add_theme_font_size_override("font_size", 20)
	button.add_theme_color_override("font_color", Color("#cad1df"))
	button.add_theme_stylebox_override("normal", _poker_card_style(Color("#25352f"), Color("#4a5f55"), 2, false))
	_apply_button_text_depth(button)
	return button


func _refresh_blackjack_action_button_styles() -> void:
	if blackjack_deal_button == null:
		return

	_apply_poker_action_button_style(blackjack_deal_button, not blackjack_deal_button.disabled, Color("#2f8f5b"))
	_apply_poker_action_button_style(blackjack_hit_button, not blackjack_hit_button.disabled, Color("#336b9d"))
	_apply_poker_action_button_style(blackjack_stand_button, not blackjack_stand_button.disabled, Color("#9d6b33"))


func _refresh_three_card() -> void:
	if three_card_bankroll_label == null:
		return

	var net := three_card_total_paid - three_card_total_wagered
	three_card_bankroll_label.text = "Credits: $%.2f  |  Hands: %d  |  Net: %s" % [
		three_card_credits,
		three_card_hands_played,
		_format_signed_money(net),
	]

	three_card_deal_button.disabled = three_card_in_round
	three_card_play_button.disabled = not three_card_in_round
	three_card_fold_button.disabled = not three_card_in_round
	three_card_ante_spin.editable = not three_card_in_round
	three_card_pair_plus_spin.editable = not three_card_in_round
	_refresh_three_card_action_button_styles()

	if three_card_player_cards.is_empty():
		three_card_status_label.text = "Deal a 3 Card Poker hand."
		three_card_tip_label.text = "Tip: deal a hand to get a Play/Fold suggestion."
	else:
		three_card_status_label.text = "Dealer qualifies with Queen-high or better." if three_card_in_round else "Hand complete. Deal again when ready."
		three_card_tip_label.text = _get_three_card_strategy_tip()

	three_card_dealer_label.text = _three_card_hand_label("Dealer", three_card_dealer_cards, not three_card_reveal_dealer)
	three_card_player_label.text = _three_card_hand_label("Player", three_card_player_cards, false)
	_refresh_three_card_row(three_card_dealer_row, three_card_dealer_cards, not three_card_reveal_dealer)
	_refresh_three_card_row(three_card_player_row, three_card_player_cards, false)


func _refresh_three_card_row(row: HBoxContainer, cards: Array, hidden: bool) -> void:
	for child in row.get_children():
		row.remove_child(child)
		child.queue_free()

	if cards.is_empty():
		row.add_child(_build_three_card_placeholder_card())
		return

	for i in cards.size():
		row.add_child(_build_three_card_card_button(cards[i], hidden, i))


func _build_three_card_card_button(card: Dictionary, hidden: bool, index: int) -> Button:
	var button := Button.new()
	button.custom_minimum_size = THREE_CARD_DISPLAY_SIZE
	button.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	button.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	button.disabled = true
	button.expand_icon = true
	button.icon_alignment = HORIZONTAL_ALIGNMENT_CENTER
	button.vertical_icon_alignment = VERTICAL_ALIGNMENT_CENTER
	button.pivot_offset = THREE_CARD_DISPLAY_SIZE * 0.5
	button.rotation_degrees = THREE_CARD_ROTATIONS[index] if index < THREE_CARD_ROTATIONS.size() else 0.0
	if hidden:
		button.text = "?"
		button.add_theme_font_size_override("font_size", 42)
		button.add_theme_color_override("font_color", Color("#f6f0df"))
		button.add_theme_stylebox_override("normal", _poker_card_style(Color("#26314a"), Color("#6576b4"), 3, true))
	else:
		var texture := _get_poker_card_texture(card)
		if texture != null:
			button.icon = texture
			button.text = ""
		else:
			button.text = "%s\n%s" % [_rank_label(int(card["rank"])), str(card["suit"])]
		button.add_theme_color_override("font_color", _poker_suit_color(str(card["suit"])))
		button.add_theme_font_size_override("font_size", 28)
		button.add_theme_stylebox_override("normal", _poker_card_style(Color("#f7f1e7"), _poker_suit_color(str(card["suit"])), 2, false))
	_apply_button_text_depth(button)
	return button


func _build_three_card_placeholder_card() -> Button:
	var button := Button.new()
	button.custom_minimum_size = THREE_CARD_DISPLAY_SIZE
	button.disabled = true
	button.text = "3 CARD"
	button.add_theme_font_size_override("font_size", 20)
	button.add_theme_color_override("font_color", Color("#cad1df"))
	button.add_theme_stylebox_override("normal", _poker_card_style(Color("#25352f"), Color("#4a5f55"), 2, false))
	_apply_button_text_depth(button)
	return button


func _refresh_three_card_action_button_styles() -> void:
	if three_card_deal_button == null:
		return

	_apply_poker_action_button_style(three_card_deal_button, not three_card_deal_button.disabled, Color("#2f8f5b"))
	_apply_poker_action_button_style(three_card_play_button, not three_card_play_button.disabled, Color("#336b9d"))
	_apply_poker_action_button_style(three_card_fold_button, not three_card_fold_button.disabled, Color("#9d4a33"))


func _refresh_baccarat() -> void:
	if baccarat_bankroll_label == null:
		return

	var net := baccarat_total_paid - baccarat_total_wagered
	baccarat_bankroll_label.text = "Credits: $%.2f  |  Hands: %d  |  Net: %s" % [
		baccarat_credits,
		baccarat_hands_played,
		_format_signed_money(net),
	]
	baccarat_status_label.text = "Choose Player, Banker, or Tie, then deal."
	baccarat_tip_label.text = "Tip: Banker has the lowest house edge. Tie pays more but hits rarely."
	baccarat_player_label.text = "Player: %s" % ("-" if baccarat_player_cards.is_empty() else str(_baccarat_total(baccarat_player_cards)))
	baccarat_banker_label.text = "Banker: %s" % ("-" if baccarat_banker_cards.is_empty() else str(_baccarat_total(baccarat_banker_cards)))
	_apply_poker_action_button_style(baccarat_deal_button, true, Color("#2f8f5b"))
	_refresh_baccarat_card_row(baccarat_player_row, baccarat_player_cards)
	_refresh_baccarat_card_row(baccarat_banker_row, baccarat_banker_cards)


func _refresh_baccarat_card_row(row: HBoxContainer, cards: Array) -> void:
	for child in row.get_children():
		row.remove_child(child)
		child.queue_free()

	if cards.is_empty():
		row.add_child(_build_baccarat_placeholder_card())
		return

	for i in cards.size():
		row.add_child(_build_baccarat_card_button(cards[i], i))


func _build_baccarat_card_button(card: Dictionary, index: int) -> Button:
	var button := Button.new()
	button.custom_minimum_size = BACCARAT_CARD_DISPLAY_SIZE
	button.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	button.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	button.disabled = true
	button.expand_icon = true
	button.icon_alignment = HORIZONTAL_ALIGNMENT_CENTER
	button.vertical_icon_alignment = VERTICAL_ALIGNMENT_CENTER
	button.pivot_offset = BACCARAT_CARD_DISPLAY_SIZE * 0.5
	button.rotation_degrees = BACCARAT_CARD_ROTATIONS[index] if index < BACCARAT_CARD_ROTATIONS.size() else 0.0
	var texture := _get_poker_card_texture(card)
	if texture != null:
		button.icon = texture
		button.text = ""
	else:
		button.text = "%s\n%s" % [_rank_label(int(card["rank"])), str(card["suit"])]
	button.add_theme_color_override("font_color", _poker_suit_color(str(card["suit"])))
	button.add_theme_font_size_override("font_size", 28)
	button.add_theme_stylebox_override("normal", _poker_card_style(Color("#f7f1e7"), _poker_suit_color(str(card["suit"])), 2, false))
	_apply_button_text_depth(button)
	return button


func _build_baccarat_placeholder_card() -> Button:
	var button := Button.new()
	button.custom_minimum_size = BACCARAT_CARD_DISPLAY_SIZE
	button.disabled = true
	button.text = "BACCARAT"
	button.add_theme_font_size_override("font_size", 18)
	button.add_theme_color_override("font_color", Color("#cad1df"))
	button.add_theme_stylebox_override("normal", _poker_card_style(Color("#25352f"), Color("#4a5f55"), 2, false))
	_apply_button_text_depth(button)
	return button


func _refresh_craps() -> void:
	if craps_bankroll_label == null:
		return

	var net := craps_total_paid - craps_total_wagered
	craps_bankroll_label.text = "Credits: $%.2f  |  Rolls: %d  |  Net: %s" % [
		craps_credits,
		craps_rolls_played,
		_format_signed_money(net),
	]
	craps_status_label.text = "Come-out roll: set the table and hunt for 7 or 11." if craps_point == 0 else "Point is %d. Make the point before seven-out." % craps_point
	craps_point_label.text = "POINT OFF" if craps_point == 0 else "POINT %d" % craps_point
	craps_tip_label.text = _craps_strategy_tip()
	craps_bets_label.text = _craps_active_bets_text()
	craps_history_label.text = _craps_history_text()
	craps_roll_button.disabled = craps_roll_in_progress or _craps_total_active_bets() <= 0.0
	_apply_poker_action_button_style(craps_roll_button, not craps_roll_button.disabled, Color("#2f8f5b"))
	_apply_poker_action_button_style(craps_reset_button, true, Color("#8f3535"))
	_refresh_craps_chip_selector()

	for number in CRAPS_POINT_NUMBERS:
		if not craps_point_markers.has(number):
			continue
		var marker: Button = craps_point_markers[number]
		var active := craps_point == int(number)
		marker.add_theme_stylebox_override("normal", _craps_point_style(active))
		marker.add_theme_stylebox_override("disabled", _craps_point_style(active))
		marker.add_theme_color_override("font_color", Color("#101317") if active else Color("#f6f0df"))

	for key in craps_bet_labels.keys():
		var amount := float(craps_bets.get(key, 0.0))
		var disabled: bool = craps_roll_in_progress or (craps_point != 0 and (key == "pass" or key == "dont_pass"))
		var buttons: Array = craps_bet_labels[key]
		for button_value in buttons:
			var button: Button = button_value
			button.disabled = disabled
			_apply_craps_zone_style(button, amount > 0.0, disabled)

	_refresh_craps_chips()


func _refresh_roulette() -> void:
	if roulette_bankroll_label == null:
		return

	var net := roulette_total_paid - roulette_total_wagered
	roulette_bankroll_label.text = "Credits: $%.2f  |  Spins: %d  |  Net: %s" % [
		roulette_credits,
		roulette_spins_played,
		_format_signed_money(net),
	]

	var bet := float(roulette_bet_spin.value)
	var can_spin := bet <= roulette_credits
	roulette_spin_button.disabled = not can_spin
	roulette_bet_spin.editable = true
	_apply_poker_action_button_style(roulette_spin_button, can_spin, Color("#2f8f5b"))
	_apply_poker_action_button_style(roulette_reset_button, true, Color("#8f3535"))

	var selected_bet := roulette_bet_option.get_item_text(roulette_bet_option.selected) if roulette_bet_option != null else "Red"
	roulette_status_label.text = "American roulette: pick a bet, set a wager, then spin the 0/00 wheel."
	roulette_tip_label.text = "Current bet: %s. Outside bets are steadier; straight numbers pay more but hit rarely." % selected_bet
	if roulette_result_label.text.is_empty():
		roulette_result_label.text = "Choose a roulette bet and spin."

	if roulette_history_label != null:
		if roulette_spin_history.is_empty():
			roulette_history_label.text = "Spin history will appear here."
		else:
			roulette_history_label.text = "\n".join(roulette_spin_history)


func _set_craps_dice(die_a: int, die_b: int, rolling: bool, roll_frame := 0) -> void:
	craps_last_roll = [die_a, die_b]
	if craps_die_one != null:
		var texture_a := _get_craps_roll_texture(0, roll_frame) if rolling else _get_craps_die_texture(die_a)
		if texture_a == null:
			texture_a = _get_craps_die_texture(die_a)
		craps_die_one.texture = texture_a
		craps_die_one.rotation_degrees = randf_range(-18.0, 18.0) if rolling else -7.0
		craps_die_one.scale = Vector2(1.08, 1.08) if rolling else Vector2.ONE
	if craps_die_two != null:
		var texture_b := _get_craps_roll_texture(1, roll_frame + 7) if rolling else _get_craps_die_texture(die_b)
		if texture_b == null:
			texture_b = _get_craps_die_texture(die_b)
		craps_die_two.texture = texture_b
		craps_die_two.rotation_degrees = randf_range(-18.0, 18.0) if rolling else 8.0
		craps_die_two.scale = Vector2(1.08, 1.08) if rolling else Vector2.ONE


func _resolve_craps_roll(die_a: int, die_b: int) -> void:
	var total := die_a + die_b
	craps_rolls_played += 1
	craps_roll_history.push_front("%d + %d = %d%s" % [die_a, die_b, total, " HARD" if die_a == die_b else ""])
	if craps_roll_history.size() > 10:
		craps_roll_history.pop_back()

	var lines := ["Rolled %d + %d = %d." % [die_a, die_b, total]]
	_resolve_craps_line_bets(total, lines)
	_resolve_craps_one_roll_bets(total, lines)
	_resolve_craps_big_six_eight(total, lines)
	_resolve_craps_hardways(die_a, die_b, total, lines)
	craps_result_label.text = "\n".join(lines)


func _resolve_craps_line_bets(total: int, lines: Array) -> void:
	if craps_point == 0:
		if total == 7 or total == 11:
			_craps_pay_bet("pass", 1.0, lines)
			_craps_lose_bet("dont_pass", lines)
		elif total == 2 or total == 3:
			_craps_lose_bet("pass", lines)
			_craps_pay_bet("dont_pass", 1.0, lines)
		elif total == 12:
			_craps_lose_bet("pass", lines)
			_craps_push_bet("dont_pass", lines)
		elif CRAPS_POINT_NUMBERS.has(total):
			if float(craps_bets["pass"]) > 0.0 or float(craps_bets["dont_pass"]) > 0.0:
				craps_point = total
				lines.append("Point is ON: %d." % craps_point)
			else:
				lines.append("No line bet was working, so the point stays off.")
		return

	if total == craps_point:
		_craps_pay_bet("pass", 1.0, lines)
		_craps_lose_bet("dont_pass", lines)
		lines.append("Point made. Puck is off.")
		craps_point = 0
	elif total == 7:
		_craps_lose_bet("pass", lines)
		_craps_pay_bet("dont_pass", 1.0, lines)
		lines.append("Seven-out. New come-out roll.")
		craps_point = 0


func _resolve_craps_one_roll_bets(total: int, lines: Array) -> void:
	var field := float(craps_bets["field"])
	if field > 0.0:
		if total == 2:
			_craps_pay_bet("field", 2.0, lines)
		elif total == 12:
			_craps_pay_bet("field", 3.0, lines)
		elif [3, 4, 9, 10, 11].has(total):
			_craps_pay_bet("field", 1.0, lines)
		else:
			_craps_lose_bet("field", lines)

	if float(craps_bets["any_craps"]) > 0.0:
		if total == 2 or total == 3 or total == 12:
			_craps_pay_bet("any_craps", 7.0, lines)
		else:
			_craps_lose_bet("any_craps", lines)

	if float(craps_bets["yo"]) > 0.0:
		if total == 11:
			_craps_pay_bet("yo", 15.0, lines)
		else:
			_craps_lose_bet("yo", lines)


func _resolve_craps_big_six_eight(total: int, lines: Array) -> void:
	if float(craps_bets["big_6_8"]) <= 0.0:
		return

	if total == 6 or total == 8:
		_craps_pay_bet("big_6_8", 1.0, lines)
	elif total == 7:
		_craps_lose_bet("big_6_8", lines)


func _resolve_craps_hardways(die_a: int, die_b: int, total: int, lines: Array) -> void:
	if total == 7:
		for hardway in CRAPS_HARDWAYS:
			_craps_lose_bet("hard_%d" % hardway, lines)
		return

	if not CRAPS_HARDWAYS.has(total):
		return

	var key := "hard_%d" % total
	if die_a == die_b:
		_craps_pay_bet(key, 9.0 if total == 6 or total == 8 else 7.0, lines)
	else:
		_craps_lose_bet(key, lines)


func _craps_pay_bet(key: String, odds: float, lines: Array) -> void:
	var stake := float(craps_bets.get(key, 0.0))
	if stake <= 0.0:
		return
	var paid := stake * (odds + 1.0)
	craps_credits += paid
	craps_total_paid += paid
	craps_bets[key] = 0.0
	lines.append("%s wins: paid $%.2f." % [_craps_bet_display_name(key), paid])


func _craps_push_bet(key: String, lines: Array) -> void:
	var stake := float(craps_bets.get(key, 0.0))
	if stake <= 0.0:
		return
	craps_credits += stake
	craps_total_paid += stake
	craps_bets[key] = 0.0
	lines.append("%s pushes: $%.2f returned." % [_craps_bet_display_name(key), stake])


func _craps_lose_bet(key: String, lines: Array) -> void:
	var stake := float(craps_bets.get(key, 0.0))
	if stake <= 0.0:
		return
	craps_bets[key] = 0.0
	lines.append("%s loses $%.2f." % [_craps_bet_display_name(key), stake])


func _craps_total_active_bets() -> float:
	var total := 0.0
	for key in craps_bets.keys():
		total += float(craps_bets[key])
	return total


func _craps_active_bets_text() -> String:
	var lines := ["Active bets:"]
	var has_bet := false
	for key in craps_bets.keys():
		var amount := float(craps_bets[key])
		if amount <= 0.0:
			continue
		has_bet = true
		lines.append("%s: $%.2f" % [_craps_bet_display_name(key), amount])
	if not has_bet:
		lines.append("No chips on the felt yet.")
	return "\n".join(lines)


func _craps_history_text() -> String:
	if craps_roll_history.is_empty():
		return "Roll history:\nNo rolls yet."
	var lines := ["Roll history:"]
	for entry in craps_roll_history:
		lines.append(str(entry))
	return "\n".join(lines)


func _craps_rules_text() -> String:
	return "Goal\n" \
		+ "Bet on the outcome of two dice. The main game is Pass Line or Don't Pass, built around the point.\n\n" \
		+ "Basic Flow\n" \
		+ "1. Choose a chip amount at the top.\n" \
		+ "2. Click a betting spot to place that chip.\n" \
		+ "3. Press Roll Dice.\n" \
		+ "4. On the come-out roll, 7 or 11 wins Pass Line. 2, 3, or 12 loses Pass Line. 4, 5, 6, 8, 9, or 10 becomes the point.\n\n" \
		+ "Point On\n" \
		+ "Pass Line wants the point to roll again before 7. Don't Pass wants 7 before the point repeats. When either happens, the point turns off and a new come-out roll begins.\n\n" \
		+ "Pass Line\n" \
		+ "Wins on come-out 7 or 11. Loses on 2, 3, or 12. After a point is set, wins if the point repeats before 7.\n\n" \
		+ "Don't Pass\n" \
		+ "Wins on come-out 2 or 3, pushes on 12, loses on 7 or 11. After a point is set, wins if 7 rolls before the point.\n\n" \
		+ "Field\n" \
		+ "One-roll bet. 3, 4, 9, 10, and 11 pay even money. 2 pays 2:1. 12 pays 3:1. 5, 6, 7, and 8 lose.\n\n" \
		+ "Big 6/8\n" \
		+ "Working bet. 6 or 8 wins even money before a 7. Other numbers do not resolve it.\n\n" \
		+ "Any Craps\n" \
		+ "One-roll bet. 2, 3, or 12 wins and pays 7:1.\n\n" \
		+ "Yo 11\n" \
		+ "One-roll bet. Only 11 wins and pays 15:1.\n\n" \
		+ "Hardways\n" \
		+ "Hard 4 is 2+2, Hard 6 is 3+3, Hard 8 is 4+4, and Hard 10 is 5+5. A hardway wins if the double rolls before an easy version of that number or a 7. Hard 4 and Hard 10 pay 7:1. Hard 6 and Hard 8 pay 9:1.\n\n" \
		+ "Beginner Play\n" \
		+ "Start with Pass Line, roll until a point or instant result, then keep rolling until the point repeats or 7 appears. Use Field, Yo, Any Craps, and Hardways as higher-risk side bets."


func _craps_strategy_tip() -> String:
	if craps_roll_in_progress:
		return "Dice are moving..."
	if craps_point == 0:
		return "Tip: Pass Line is the friendly default. Don't Pass is leaner and moodier."
	if float(craps_bets["pass"]) > 0.0:
		return "Tip: the point is %d. Keep away from 7 and bring that number back." % craps_point
	if float(craps_bets["dont_pass"]) > 0.0:
		return "Tip: the point is %d. A 7 wins Don't Pass before the point repeats." % craps_point
	return "Tip: Big 6/8 and hardways stay working; field and proposition bets are one-roll shots."


func _craps_bet_display_name(key: String) -> String:
	match key:
		"pass":
			return "Pass Line"
		"dont_pass":
			return "Don't Pass"
		"field":
			return "Field"
		"big_6_8":
			return "Big 6/8"
		"any_craps":
			return "Any Craps"
		"yo":
			return "Yo 11"
		"hard_4":
			return "Hard 4"
		"hard_6":
			return "Hard 6"
		"hard_8":
			return "Hard 8"
		"hard_10":
			return "Hard 10"
	return key.capitalize()


func _roulette_selected_bet_id() -> String:
	if roulette_bet_option == null or roulette_bet_option.item_count <= 0:
		return "red"
	return str(roulette_bet_option.get_item_metadata(roulette_bet_option.selected))


func _roulette_bet_wins(bet_id: String, pocket: int) -> bool:
	if bet_id.begins_with("straight_"):
		return _roulette_pocket_text(pocket) == bet_id.substr("straight_".length())

	if pocket <= 0:
		return false

	var is_red := ROULETTE_RED_NUMBERS.has(pocket)
	match bet_id:
		"red":
			return is_red
		"black":
			return not is_red
		"odd":
			return pocket % 2 == 1
		"even":
			return pocket % 2 == 0
		"low":
			return pocket >= 1 and pocket <= 18
		"high":
			return pocket >= 19 and pocket <= 36
		"first_dozen":
			return pocket >= 1 and pocket <= 12
		"second_dozen":
			return pocket >= 13 and pocket <= 24
		"third_dozen":
			return pocket >= 25 and pocket <= 36
		"column_1":
			return pocket % 3 == 1
		"column_2":
			return pocket % 3 == 2
		"column_3":
			return pocket % 3 == 0
	return false


func _roulette_bet_payout_multiplier(bet_id: String) -> int:
	if bet_id.begins_with("straight_"):
		return 35

	match bet_id:
		"first_dozen", "second_dozen", "third_dozen", "column_1", "column_2", "column_3":
			return 2
	return 1


func _roulette_pocket_text(pocket: int) -> String:
	if pocket == -1:
		return "00"
	return str(pocket)


func _roulette_pocket_color_name(pocket: int) -> String:
	if pocket <= 0:
		return "green"
	return "red" if ROULETTE_RED_NUMBERS.has(pocket) else "black"


func _roulette_rules_text() -> String:
	return "Goal\n" \
		+ "Bet on where the ball lands on an American roulette wheel with 0, 00, and 1-36.\n\n" \
		+ "Basic Flow\n" \
		+ "1. Choose a bet type from the top bar.\n" \
		+ "2. Set the wager.\n" \
		+ "3. Press Spin.\n\n" \
		+ "Even Money Bets\n" \
		+ "Red/black, odd/even, and 1-18/19-36 pay 1:1. Green 0 and 00 lose these bets.\n\n" \
		+ "Dozens and Columns\n" \
		+ "Each dozen or column pays 2:1. Green 0 and 00 lose.\n\n" \
		+ "Straight Bets\n" \
		+ "Pick one exact pocket: 0, 00, or 1-36. A hit pays 35:1.\n\n" \
		+ "Beginner Play\n" \
		+ "Red or black is the simplest starting bet. Straight numbers are fun long shots, but they miss much more often."


func _refresh_cards() -> void:
	for i in CARD_COUNT:
		var button: Button = card_buttons[i]
		var picks: Array = card_picks[i]
		var pick_text := _format_card_pick_text(picks)
		if not reveal_all_card_numbers and i != selected_card:
			pick_text = ""
		var profit := float(card_profit[i])
		var win_rate := 0.0
		if card_plays[i] > 0:
			win_rate = float(card_wins[i]) / float(card_plays[i]) * 100.0
		button.text = "Card %s\n%d/%d picks\nP:%d W:%.1f%% Net:%s\n%s" % [
			_card_label(i),
			picks.size(),
			MAX_PICKS_PER_CARD,
			card_plays[i],
			win_rate,
			_format_signed_whole(profit),
			pick_text,
		]
		button.button_pressed = i == selected_card
		var border := Color("#f6f0df") if i == selected_card else Color("#00000044")
		button.add_theme_stylebox_override("normal", _button_style(CARD_COLORS[i].darkened(0.28), border, 3 if i == selected_card else 1))
		button.add_theme_stylebox_override("hover", _button_style(CARD_COLORS[i].darkened(0.15), Color("#f6f0df"), 2))
		button.add_theme_stylebox_override("pressed", _button_style(CARD_COLORS[i].darkened(0.04), Color("#ffffff"), 3, true))
		button.add_theme_color_override("font_color", Color("#ffffff"))
		button.add_theme_font_size_override("font_size", CARD_BUTTON_FONT_SIZE)
		_apply_button_text_depth(button)


func _refresh_numbers() -> void:
	for number in range(1, NUMBER_MAX + 1):
		var button: Button = number_buttons[number]
		var owners := _owners_for_number(number)
		if not reveal_all_card_numbers and not owners.has(selected_card):
			owners = []
		elif not reveal_all_card_numbers:
			owners = [selected_card]
		var bg := Color("#00000000")
		var border := Color("#00000000")
		var border_width := 0

		if owners.size() == 1:
			var owner_color: Color = CARD_COLORS[owners[0]]
			bg = Color(owner_color.r, owner_color.g, owner_color.b, 0.46)
			border = owner_color.lightened(0.45)
			border_width = 3
		elif owners.size() > 1:
			bg = Color(0.78, 0.6, 0.18, 0.5)
			border = Color("#f6d45d")
			border_width = 3

		if last_draw.has(number):
			if owners.is_empty():
				bg = Color(0.08, 1.0, 0.9, 0.18)
			border = Color("#f6f0df")
			border_width = max(border_width, 4)

		button.text = ""
		button.tooltip_text = _number_tooltip(number, owners, last_draw.has(number))
		button.add_theme_stylebox_override("normal", _keno_board_button_style(bg, border, border_width))
		button.add_theme_stylebox_override("hover", _keno_board_button_style(bg.lightened(0.12), Color("#f6f0df"), max(border_width, 2)))
		button.add_theme_stylebox_override("pressed", _keno_board_button_style(bg.lightened(0.2), Color("#ffffff"), max(border_width, 3), true))
		button.add_theme_stylebox_override("focus", _keno_board_button_style(Color("#00000000"), Color("#00000000"), 0))
		button.add_theme_color_override("font_color", Color("#ffffff"))
		button.add_theme_font_size_override("font_size", NUMBER_BUTTON_FONT_SIZE)
		_apply_button_text_depth(button)

	_refresh_keno_ball_colors()


func _layout_keno_board_buttons() -> void:
	if keno_board_control == null:
		return

	var board_size := keno_board_control.size
	if board_size.x <= 0.0 or board_size.y <= 0.0:
		return

	var inset: float = max(1.0, min(board_size.x, board_size.y) * 0.004)
	for number in range(1, NUMBER_MAX + 1):
		if not number_buttons.has(number):
			continue

		var cell_rect := _keno_board_cell_rect(number)
		if cell_rect.size == Vector2.ZERO:
			continue

		var button: Button = number_buttons[number]
		button.position = cell_rect.position + Vector2(inset, inset)
		button.size = Vector2(max(1.0, cell_rect.size.x - inset * 2.0), max(1.0, cell_rect.size.y - inset * 2.0))


func _keno_board_cell_rect(number: int) -> Rect2:
	if keno_board_control == null:
		return Rect2()

	var board_size := keno_board_control.size
	if board_size.x <= 0.0 or board_size.y <= 0.0:
		return Rect2()

	var row := int((number - 1) / 10)
	var column := int((number - 1) % 10)
	if row < 0 or row >= KENO_BOARD_ROW_TOPS.size() or column < 0 or column + 1 >= KENO_BOARD_COL_EDGES.size():
		return Rect2()

	var scale := Vector2(board_size.x / KENO_BOARD_REFERENCE_SIZE.x, board_size.y / KENO_BOARD_REFERENCE_SIZE.y)
	var left: float = float(KENO_BOARD_COL_EDGES[column]) * scale.x
	var right: float = float(KENO_BOARD_COL_EDGES[column + 1]) * scale.x
	var top: float = float(KENO_BOARD_ROW_TOPS[row]) * scale.y
	var bottom: float = float(KENO_BOARD_ROW_BOTTOMS[row]) * scale.y
	return Rect2(Vector2(left, top), Vector2(right - left, bottom - top))


func _layout_keno_ball_tube() -> void:
	if keno_ball_stage == null or keno_ball_tube == null or keno_ball_spout == null:
		return

	var stage_width := keno_ball_stage.size.x
	if stage_width <= 0.0:
		return

	keno_ball_tube.size = Vector2(250, 34)
	keno_ball_tube.position = Vector2((stage_width - keno_ball_tube.size.x) * 0.5, 8)
	keno_ball_spout.size = Vector2(58, 42)
	keno_ball_spout.position = Vector2((stage_width - keno_ball_spout.size.x) * 0.5, 32)


func _animate_keno_balls() -> void:
	if keno_ball_stage == null or last_draw.is_empty():
		return

	await get_tree().process_frame
	if keno_ball_stage == null or last_draw.is_empty():
		return

	_clear_keno_balls()
	_layout_keno_ball_tube()

	var start := _keno_ball_start_position()
	keno_ball_tween = create_tween()
	keno_ball_tween.set_parallel(true)
	keno_ball_animating = true

	for i in last_draw.size():
		var number := int(last_draw[i])
		if not number_buttons.has(number):
			continue
		var ball := _make_keno_ball(number)
		var target := _keno_ball_target_for_number(number)
		ball.position = start + Vector2(randf_range(-10.0, 10.0), randf_range(-4.0, 4.0))
		ball.scale = Vector2(0.75, 0.75)
		ball.rotation = randf_range(-0.4, 0.4)
		ball.modulate.a = 0.0
		add_child(ball)
		keno_ball_nodes.append(ball)

		var delay := float(i) * 0.05
		keno_ball_tween.tween_property(ball, "modulate:a", 1.0, 0.12).set_delay(delay)
		keno_ball_tween.tween_property(ball, "position", target, 0.56).set_delay(delay).set_trans(Tween.TRANS_BOUNCE).set_ease(Tween.EASE_OUT)
		keno_ball_tween.tween_property(ball, "rotation", randf_range(-0.08, 0.08), 0.56).set_delay(delay).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
		keno_ball_tween.tween_property(ball, "scale", Vector2.ONE, 0.28).set_delay(delay).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)

	if keno_ball_nodes.is_empty():
		keno_ball_animating = false
	else:
		keno_ball_tween.finished.connect(_on_keno_ball_animation_finished)


func _keno_ball_start_position() -> Vector2:
	var spout_center: Vector2 = keno_ball_spout.get_global_rect().get_center()
	return _keno_global_point_to_overlay(spout_center) - Vector2(KENO_BALL_SIZE, KENO_BALL_SIZE) * 0.5


func _keno_ball_target_for_number(number: int) -> Vector2:
	var cell_rect := _keno_board_cell_rect(number)
	if cell_rect.size == Vector2.ZERO:
		return Vector2.ZERO

	var board_center: Vector2 = keno_board_control.get_global_position() + cell_rect.get_center()
	var local_center: Vector2 = _keno_global_point_to_overlay(board_center)
	return local_center - Vector2(KENO_BALL_SIZE, KENO_BALL_SIZE) * 0.5


func _keno_global_point_to_overlay(point: Vector2) -> Vector2:
	return point - global_position


func _clear_keno_balls() -> void:
	keno_ball_animating = false
	if keno_ball_tween != null and keno_ball_tween.is_valid():
		keno_ball_tween.kill()
	for ball in keno_ball_nodes:
		if is_instance_valid(ball):
			ball.queue_free()
	keno_ball_nodes.clear()


func _on_keno_ball_animation_finished() -> void:
	keno_ball_animating = false


func _make_keno_ball(number: int) -> Control:
	var ball := Control.new()
	ball.custom_minimum_size = Vector2(KENO_BALL_SIZE, KENO_BALL_SIZE)
	ball.size = Vector2(KENO_BALL_SIZE, KENO_BALL_SIZE)
	ball.pivot_offset = Vector2(KENO_BALL_SIZE, KENO_BALL_SIZE) * 0.5
	ball.mouse_filter = Control.MOUSE_FILTER_IGNORE
	ball.z_index = 100
	ball.set_meta("number", number)

	var ring := PanelContainer.new()
	ring.name = "MatchRing"
	ring.set_anchors_preset(Control.PRESET_FULL_RECT)
	ring.mouse_filter = Control.MOUSE_FILTER_IGNORE
	ball.add_child(ring)

	var texture := TextureRect.new()
	texture.name = "BallTexture"
	texture.set_anchors_preset(Control.PRESET_FULL_RECT)
	texture.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	texture.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
	texture.mouse_filter = Control.MOUSE_FILTER_IGNORE
	texture.texture = keno_ball_textures.get(number, null)
	ball.add_child(texture)

	if texture.texture == null:
		var fallback := Label.new()
		fallback.name = "FallbackNumber"
		fallback.text = str(number)
		fallback.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		fallback.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		fallback.set_anchors_preset(Control.PRESET_FULL_RECT)
		fallback.add_theme_font_size_override("font_size", 16)
		fallback.mouse_filter = Control.MOUSE_FILTER_IGNORE
		ball.add_child(fallback)

	_apply_keno_ball_color(ball)
	return ball


func _refresh_keno_ball_colors() -> void:
	for ball in keno_ball_nodes:
		if is_instance_valid(ball):
			_apply_keno_ball_color(ball)


func _apply_keno_ball_color(ball: Control) -> void:
	var number := int(ball.get_meta("number", 0))
	var matched: bool = card_picks[selected_card].has(number)
	var ring := ball.get_node_or_null("MatchRing") as PanelContainer
	var texture := ball.get_node_or_null("BallTexture") as TextureRect
	var fallback := ball.get_node_or_null("FallbackNumber") as Label
	if ring != null:
		ring.visible = matched
		ring.add_theme_stylebox_override("panel", _keno_ball_match_ring_style())
	if texture != null:
		texture.modulate = Color("#baffd2") if matched else Color.WHITE
	if fallback == null:
		return
	var bg := Color("#eef4ff")
	var border := Color("#7fa7d8")
	var font := Color("#17202c")
	if matched:
		bg = Color("#27b86c")
		border = Color("#f5d067")
		font = Color("#ffffff")
	fallback.add_theme_stylebox_override("normal", _keno_ball_style(bg, border, matched))
	fallback.add_theme_color_override("font_color", font)
	fallback.add_theme_color_override("font_shadow_color", Color("#00000077"))
	fallback.add_theme_constant_override("shadow_offset_x", 1)
	fallback.add_theme_constant_override("shadow_offset_y", 1)


func _refresh_labels() -> void:
	var selected_picks: Array = card_picks[selected_card]
	selected_label.text = "Selected Card %s  |  %d/%d picks" % [_card_label(selected_card), selected_picks.size(), MAX_PICKS_PER_CARD]

	if last_draw.is_empty():
		last_draw_label.text = "Last draw: play a round to draw 20 numbers."
	else:
		last_draw_label.text = "Last draw: %s" % ", ".join(_stringify_numbers(last_draw, DRAW_COUNT))

	var win_rate := 0.0
	var loss_rate := 0.0
	if rounds_played > 0:
		win_rate = float(winning_rounds) / float(rounds_played) * 100.0
		loss_rate = float(losing_rounds) / float(rounds_played) * 100.0
	stats_label.text = "Rounds played: %d\nWins: %d (%.1f%%)\nLosses: %d (%.1f%%)\nTotal wagered: $%.2f\nTotal paid: $%.2f\nNet: %s" % [
		rounds_played,
		winning_rounds,
		win_rate,
		losing_rounds,
		loss_rate,
		total_wagered,
		total_paid,
		_format_signed_money(total_paid - total_wagered),
	]
	hit_tally_label.text = _format_hit_tally()
	recent_runs_label.text = _format_recent_runs_tally()

	var hot := _get_hot_numbers(10)
	var cold := _get_cold_numbers(10)
	hot_label.text = "Most hits: %s" % _format_count_list(hot)
	cold_label.text = "Least hits: %s" % _format_count_list(cold)

	if rounds_played == 0:
		suggestion_label.text = "Trend picks: play a few rounds to build live hit data. Keno draws are random, so hot numbers do not change the true odds."
	else:
		suggestion_label.text = "Trend picks for Card %s: %s\nOdds note: the game still draws randomly; this is based only on your live history." % [
			_card_label(selected_card),
			", ".join(_stringify_numbers(hot, 10)),
		]


func _record_recent_run(round_number: int, active_card_count: int, hits: int, paid: float, wagered: float) -> void:
	recent_runs.append({
		"round": round_number,
		"cards": active_card_count,
		"hits": hits,
		"paid": paid,
		"net": paid - wagered,
	})
	while recent_runs.size() > RECENT_RUN_LIMIT:
		recent_runs.pop_front()


func _record_hit_tally(spots: int, matches: int) -> void:
	if not hit_tally.has(spots):
		hit_tally[spots] = {}

	var spot_tally: Dictionary = hit_tally[spots]
	spot_tally[matches] = int(spot_tally.get(matches, 0)) + 1


func _reset_all_time_counters() -> void:
	rounds_played = 0
	winning_rounds = 0
	losing_rounds = 0
	total_wagered = 0.0
	total_paid = 0.0


func _reset_card_counters(card_index: int) -> void:
	card_plays[card_index] = 0
	card_wins[card_index] = 0
	card_profit[card_index] = 0.0


func _reset_all_card_counters() -> void:
	for i in CARD_COUNT:
		_reset_card_counters(i)


func _reset_number_hit_counters() -> void:
	for i in number_hit_counts.size():
		number_hit_counts[i] = 0
	last_draw.clear()
	_clear_keno_balls()


func _reset_hit_tally() -> void:
	hit_tally.clear()


func _get_active_cards() -> Array:
	var cards := []
	for i in CARD_COUNT:
		if not card_picks[i].is_empty():
			cards.append(i)
	return cards


func _get_quick_pick_count() -> int:
	return clampi(int(quick_pick_count_spin.value), 1, MAX_PICKS_PER_CARD)


func _load_keno_ball_textures() -> void:
	keno_ball_textures.clear()
	var files := DirAccess.get_files_at(KENO_BALL_DIR)
	for file in files:
		if not file.to_lower().ends_with(".png"):
			continue
		var number := _keno_ball_number_from_filename(file)
		if number < 1 or number > NUMBER_MAX:
			continue
		var texture := _load_image_texture(KENO_BALL_DIR.path_join(file))
		if texture != null:
			keno_ball_textures[number] = texture


func _load_craps_dice_textures() -> void:
	craps_dice_textures.clear()
	for i in CRAPS_DICE_FACE_FILES.size():
		var texture := _load_image_texture(CRAPS_DICE_DIR.path_join(str(CRAPS_DICE_FACE_FILES[i])))
		if texture != null:
			craps_dice_textures[i + 1] = texture


func _load_craps_chip_textures() -> void:
	craps_chip_textures.clear()
	for denomination in CRAPS_CHIP_DENOMINATIONS:
		var amount := int(denomination)
		var texture := _load_image_texture(CRAPS_CHIP_DIR.path_join("%d.png" % amount))
		if texture != null:
			craps_chip_textures[amount] = texture


func _load_craps_roll_textures() -> void:
	craps_roll_sequences.clear()
	var files := DirAccess.get_files_at(CRAPS_DICE_ROLL_DIR)
	if files.is_empty():
		return

	var groups := {}
	for file in files:
		if not file.to_lower().ends_with(".png"):
			continue
		var parts := file.split("_0000s_")
		if parts.size() < 2:
			continue
		var group_key := str(parts[0])
		if not groups.has(group_key):
			groups[group_key] = []
		groups[group_key].append(file)

	var group_keys := groups.keys()
	group_keys.sort()
	for key in group_keys:
		var sequence_files: Array = groups[key]
		sequence_files.sort_custom(func(a, b) -> bool:
			return _craps_roll_frame_number(str(a)) < _craps_roll_frame_number(str(b))
		)
		var sequence := []
		for file in sequence_files:
			var texture := _load_image_texture(CRAPS_DICE_ROLL_DIR.path_join(str(file)))
			if texture != null:
				sequence.append(texture)
		if not sequence.is_empty():
			craps_roll_sequences.append(sequence)


func _craps_roll_frame_number(file: String) -> int:
	var marker := "_0000s_"
	var marker_index := file.find(marker)
	if marker_index < 0:
		return 0
	var start := marker_index + marker.length()
	var end := file.find("_", start)
	if end < 0:
		return 0
	return int(file.substr(start, end - start))


func _get_craps_die_texture(value: int) -> Texture2D:
	return craps_dice_textures.get(clampi(value, 1, 6), null)


func _get_craps_roll_texture(die_slot: int, frame: int) -> Texture2D:
	if craps_roll_sequences.is_empty():
		return null
	var sequence: Array = craps_roll_sequences[die_slot % craps_roll_sequences.size()]
	if sequence.is_empty():
		return null
	return sequence[frame % sequence.size()]


func _get_craps_chip_texture(amount: float) -> Texture2D:
	var amount_key := _craps_chip_texture_key(amount)
	if amount_key > 0 and craps_chip_textures.has(amount_key):
		return craps_chip_textures[amount_key]

	var fallback_key := _largest_craps_chip_key(amount)
	if fallback_key > 0:
		return craps_chip_textures.get(fallback_key, null)

	return null


func _has_exact_craps_chip_texture(amount: float) -> bool:
	var amount_key := _craps_chip_texture_key(amount)
	return amount_key > 0 and craps_chip_textures.has(amount_key)


func _craps_chip_texture_key(amount: float) -> int:
	if not is_equal_approx(amount, roundf(amount)):
		return 0

	var amount_key := int(roundf(amount))
	if craps_chip_textures.has(amount_key):
		return amount_key
	return 0


func _largest_craps_chip_key(amount: float) -> int:
	var best_key := 0
	for key_value in craps_chip_textures.keys():
		var key := int(key_value)
		if float(key) <= amount and key > best_key:
			best_key = key
	return best_key


func _keno_ball_number_from_filename(file: String) -> int:
	var parts := file.get_basename().split("_")
	if parts.is_empty():
		return 0
	return int(str(parts[parts.size() - 1]))


func _load_image_texture(path: String) -> Texture2D:
	var image := Image.new()
	var err := image.load(path)
	if err == OK:
		return ImageTexture.create_from_image(image)
	var resource = load(path)
	if resource is Texture2D:
		return resource
	return null


func _draw_numbers() -> Array:
	return _draw_unique(DRAW_COUNT, NUMBER_MAX)


func _draw_unique(count: int, max_number: int) -> Array:
	var pool := []
	for number in range(1, max_number + 1):
		pool.append(number)
	pool.shuffle()
	var picked := pool.slice(0, count)
	picked.sort()
	return picked


func _build_poker_deck() -> Array:
	var deck := []
	for suit in POKER_SUITS:
		for rank in POKER_RANKS:
			deck.append({
				"rank": rank,
				"suit": suit,
				"image_path": _poker_card_image_path(suit, rank),
			})
	return deck


func _draw_poker_card() -> Dictionary:
	if poker_deck.is_empty():
		poker_deck = _build_poker_deck()
		poker_deck.shuffle()
	var card: Dictionary = poker_deck.pop_back()
	return card


func _draw_blackjack_card() -> Dictionary:
	if blackjack_deck.is_empty():
		blackjack_deck = _build_poker_deck()
		blackjack_deck.shuffle()
	var card: Dictionary = blackjack_deck.pop_back()
	return card


func _draw_three_card() -> Dictionary:
	if three_card_deck.is_empty():
		three_card_deck = _build_poker_deck()
		three_card_deck.shuffle()
	var card: Dictionary = three_card_deck.pop_back()
	return card


func _draw_pai_gow_card() -> Dictionary:
	if pai_gow_deck.is_empty():
		pai_gow_deck = _build_poker_deck()
		pai_gow_deck.shuffle()
	var card: Dictionary = pai_gow_deck.pop_back()
	return card


func _draw_baccarat_card() -> Dictionary:
	if baccarat_deck.is_empty():
		baccarat_deck = _build_poker_deck()
		baccarat_deck.shuffle()
	var card: Dictionary = baccarat_deck.pop_back()
	return card


func _apply_baccarat_draw_rules() -> void:
	var player_total := _baccarat_total(baccarat_player_cards)
	var banker_total := _baccarat_total(baccarat_banker_cards)
	if player_total >= 8 or banker_total >= 8:
		return

	var player_third := -1
	if player_total <= 5:
		var card := _draw_baccarat_card()
		baccarat_player_cards.append(card)
		player_third = _baccarat_card_value(card)

	banker_total = _baccarat_total(baccarat_banker_cards)
	if player_third == -1:
		if banker_total <= 5:
			baccarat_banker_cards.append(_draw_baccarat_card())
		return

	if _baccarat_banker_draws(banker_total, player_third):
		baccarat_banker_cards.append(_draw_baccarat_card())


func _baccarat_banker_draws(banker_total: int, player_third: int) -> bool:
	if banker_total <= 2:
		return true
	if banker_total == 3:
		return player_third != 8
	if banker_total == 4:
		return player_third >= 2 and player_third <= 7
	if banker_total == 5:
		return player_third >= 4 and player_third <= 7
	if banker_total == 6:
		return player_third == 6 or player_third == 7
	return false


func _baccarat_total(cards: Array) -> int:
	var total := 0
	for card in cards:
		total += _baccarat_card_value(card)
	return total % 10


func _baccarat_card_value(card: Dictionary) -> int:
	var rank := int(card["rank"])
	if rank == 14:
		return 1
	if rank >= 10:
		return 0
	return rank


func _baccarat_payout(bet: float, bet_side: String, winner: String) -> float:
	if bet_side != winner:
		return 0.0
	if winner == "Player":
		return bet * 2.0
	if winner == "Banker":
		return bet * 1.95
	return bet * 9.0


func _finish_three_card_round(message: String, payout: float) -> void:
	three_card_credits += payout
	three_card_total_paid += payout
	three_card_in_round = false
	three_card_reveal_dealer = true
	three_card_result_label.text = "%s Total paid $%.2f." % [message, payout]
	_refresh_three_card()


func _finish_blackjack_round(message: String, payout: float) -> void:
	blackjack_credits += payout
	blackjack_total_paid += payout
	blackjack_in_round = false
	blackjack_round_over = true
	blackjack_result_label.text = "%s Paid $%.2f." % [message, payout]
	_refresh_blackjack()


func _blackjack_hand_value(cards: Array) -> Dictionary:
	var total := 0
	var aces := 0
	for card_value in cards:
		var card: Dictionary = card_value
		var rank := int(card["rank"])
		if rank == 14:
			total += 11
			aces += 1
		else:
			total += min(rank, 10)

	while total > 21 and aces > 0:
		total -= 10
		aces -= 1

	return {
		"total": total,
		"soft": aces > 0,
	}


func _is_blackjack(cards: Array) -> bool:
	return cards.size() == 2 and int(_blackjack_hand_value(cards)["total"]) == 21


func _blackjack_dealer_total_text() -> String:
	if blackjack_dealer_cards.is_empty():
		return "Dealer"
	if blackjack_in_round and blackjack_dealer_cards.size() > 1:
		var showing := _blackjack_card_value(blackjack_dealer_cards[0])
		return "Dealer: showing %d" % showing
	return _blackjack_hand_total_text("Dealer", blackjack_dealer_cards)


func _blackjack_hand_total_text(name: String, cards: Array) -> String:
	if cards.is_empty():
		return name
	var value := _blackjack_hand_value(cards)
	return "%s: %d%s" % [
		name,
		int(value["total"]),
		" soft" if bool(value["soft"]) else "",
	]


func _blackjack_card_value(card: Dictionary) -> int:
	var rank := int(card["rank"])
	if rank == 14:
		return 11
	return min(rank, 10)


func _get_blackjack_strategy_tip() -> String:
	if blackjack_player_cards.is_empty():
		return "Tip: deal a hand to get a basic-strategy suggestion."
	if not blackjack_in_round:
		return "Tip: deal again for the next hand suggestion."

	var player := _blackjack_hand_value(blackjack_player_cards)
	var total := int(player["total"])
	var soft := bool(player["soft"])
	var dealer_up := _blackjack_card_value(blackjack_dealer_cards[0]) if not blackjack_dealer_cards.is_empty() else 10

	if total > 21:
		return "Tip: busted."
	if total == 21:
		return "Tip: stand on 21."
	if soft:
		if total >= 19:
			return "Tip: Stand. Soft %d is strong." % total
		if total == 18:
			if dealer_up >= 9 or dealer_up == 11:
				return "Tip: Hit soft 18 against a strong dealer card."
			return "Tip: Stand on soft 18."
		return "Tip: Hit soft %d." % total

	if total >= 17:
		return "Tip: Stand on hard %d." % total
	if total >= 13 and total <= 16:
		if dealer_up >= 2 and dealer_up <= 6:
			return "Tip: Stand. Dealer is showing %d." % dealer_up
		return "Tip: Hit hard %d against dealer %d." % [total, dealer_up]
	if total == 12:
		if dealer_up >= 4 and dealer_up <= 6:
			return "Tip: Stand on 12 against dealer %d." % dealer_up
		return "Tip: Hit hard 12."
	return "Tip: Hit hard %d." % total


func _pai_gow_split_from_indices(cards: Array, low_indices: Array) -> Dictionary:
	if cards.is_empty():
		return {}

	var low := []
	var high := []
	for i in cards.size():
		var card: Dictionary = cards[i]
		if low_indices.has(i):
			low.append(card)
		else:
			high.append(card)

	if low.size() != 2 or high.size() != 5:
		return {}

	return {
		"low": low,
		"high": high,
	}


func _pai_gow_house_way_low_indices(cards: Array) -> Array:
	if cards.size() != 7:
		return []

	var best_indices := [0, 1]
	var best_balance := -1
	var best_high := -1
	var best_low := -1
	for a in range(0, cards.size() - 1):
		for b in range(a + 1, cards.size()):
			var low_indices := [a, b]
			var split := _pai_gow_split_from_indices(cards, low_indices)
			if split.is_empty() or _pai_gow_split_is_foul(split):
				continue

			var low_score := _pai_gow_hand_score(_pai_gow_evaluate_two_card(split["low"]))
			var high_score := _pai_gow_hand_score(_pai_gow_evaluate_five_card(split["high"]))
			var balance: int = min(low_score, high_score)
			if balance > best_balance or (balance == best_balance and high_score > best_high) or (balance == best_balance and high_score == best_high and low_score > best_low):
				best_balance = balance
				best_high = high_score
				best_low = low_score
				best_indices = low_indices
	return best_indices


func _pai_gow_split_is_foul(split: Dictionary) -> bool:
	if split.is_empty():
		return false
	return _compare_pai_gow_evals(_pai_gow_evaluate_five_card(split["high"]), _pai_gow_evaluate_two_card(split["low"])) < 0


func _pai_gow_tip_text() -> String:
	if pai_gow_player_cards.is_empty():
		return "Tip: deal a hand to begin."
	if not pai_gow_in_round:
		return "Tip: deal again for a fresh seven-card puzzle."
	if pai_gow_low_indices.size() != 2:
		return "Tip: pick exactly two cards for Low, or use House Way."

	var split := _pai_gow_split_from_indices(pai_gow_player_cards, pai_gow_low_indices)
	if split.is_empty():
		return "Tip: pick exactly two cards for Low."
	if _pai_gow_split_is_foul(split):
		return "Tip: foul split. Move strength back to High."
	return "Tip: Low is %s. High is %s." % [
		_pai_gow_eval_name(_pai_gow_evaluate_two_card(split["low"])),
		_pai_gow_eval_name(_pai_gow_evaluate_five_card(split["high"])),
	]


func _pai_gow_evaluate_two_card(cards: Array) -> Dictionary:
	if cards.size() != 2:
		return {"name": "No Hand", "category": -1, "tiebreakers": []}

	var ranks := [int(cards[0]["rank"]), int(cards[1]["rank"])]
	ranks.sort()
	ranks.reverse()
	if int(ranks[0]) == int(ranks[1]):
		return {
			"name": "Pair of %s" % _rank_plural(int(ranks[0])),
			"category": 1,
			"tiebreakers": [int(ranks[0])],
		}

	return {
		"name": "%s-%s" % [_rank_label(int(ranks[0])), _rank_label(int(ranks[1]))],
		"category": 0,
		"tiebreakers": ranks,
	}


func _pai_gow_evaluate_five_card(cards: Array) -> Dictionary:
	if cards.size() != 5:
		return {"name": "No Hand", "category": -1, "tiebreakers": []}

	var ranks := []
	var suits := []
	var rank_counts := {}
	for card_value in cards:
		var card: Dictionary = card_value
		var rank := int(card["rank"])
		ranks.append(rank)
		suits.append(str(card["suit"]))
		rank_counts[rank] = int(rank_counts.get(rank, 0)) + 1

	ranks.sort()
	var is_flush := true
	for suit in suits:
		if suit != suits[0]:
			is_flush = false
			break

	var unique_ranks := []
	for rank in ranks:
		if not unique_ranks.has(rank):
			unique_ranks.append(rank)

	var straight_high := _pai_gow_straight_high(unique_ranks)
	var is_straight := straight_high > 0
	var count_values := []
	for count in rank_counts.values():
		count_values.append(int(count))
	count_values.sort()
	count_values.reverse()

	if is_flush and is_straight:
		return {"name": "Straight Flush", "category": 8, "tiebreakers": [straight_high]}
	if count_values[0] == 4:
		var quad := _rank_with_count(rank_counts, 4)
		return {"name": "Four of a Kind", "category": 7, "tiebreakers": [quad, _highest_except(ranks, [quad])]}
	if count_values[0] == 3 and count_values.size() > 1 and count_values[1] == 2:
		return {"name": "Full House", "category": 6, "tiebreakers": [_rank_with_count(rank_counts, 3), _rank_with_count(rank_counts, 2)]}
	if is_flush:
		return {"name": "Flush", "category": 5, "tiebreakers": _sorted_desc(ranks)}
	if is_straight:
		return {"name": "Straight", "category": 4, "tiebreakers": [straight_high]}
	if count_values[0] == 3:
		var trip := _rank_with_count(rank_counts, 3)
		var trip_breakers := [trip]
		trip_breakers.append_array(_sorted_except(ranks, [trip]))
		return {"name": "Three of a Kind", "category": 3, "tiebreakers": trip_breakers}
	if count_values[0] == 2 and count_values.size() > 1 and count_values[1] == 2:
		var pairs := []
		for rank in rank_counts.keys():
			if int(rank_counts[rank]) == 2:
				pairs.append(int(rank))
		pairs.sort()
		pairs.reverse()
		return {"name": "Two Pair", "category": 2, "tiebreakers": [pairs[0], pairs[1], _highest_except(ranks, pairs)]}
	if count_values[0] == 2:
		var pair := _rank_with_count(rank_counts, 2)
		var pair_breakers := [pair]
		pair_breakers.append_array(_sorted_except(ranks, [pair]))
		return {"name": "Pair of %s" % _rank_plural(pair), "category": 1, "tiebreakers": pair_breakers}

	return {"name": "High Card", "category": 0, "tiebreakers": _sorted_desc(ranks)}


func _pai_gow_straight_high(unique_ranks: Array) -> int:
	if unique_ranks.size() != 5:
		return 0
	if unique_ranks == [2, 3, 4, 5, 14]:
		return 5
	var high_rank := int(unique_ranks[unique_ranks.size() - 1])
	var low_rank := int(unique_ranks[0])
	if high_rank - low_rank == 4:
		return high_rank
	return 0


func _compare_pai_gow_evals(left: Dictionary, right: Dictionary) -> int:
	var left_category := int(left["category"])
	var right_category := int(right["category"])
	if left_category > right_category:
		return 1
	if left_category < right_category:
		return -1

	var left_breakers: Array = left["tiebreakers"]
	var right_breakers: Array = right["tiebreakers"]
	for i in range(0, min(left_breakers.size(), right_breakers.size())):
		if int(left_breakers[i]) > int(right_breakers[i]):
			return 1
		if int(left_breakers[i]) < int(right_breakers[i]):
			return -1
	if left_breakers.size() > right_breakers.size():
		return 1
	if left_breakers.size() < right_breakers.size():
		return -1
	return 0


func _pai_gow_hand_score(eval: Dictionary) -> int:
	var score := int(eval["category"])
	var breakers: Array = eval["tiebreakers"]
	for i in range(0, 5):
		score *= 15
		if i < breakers.size():
			score += int(breakers[i])
	return score


func _pai_gow_eval_name(eval: Dictionary) -> String:
	return str(eval.get("name", "No Hand"))


func _highest_except(ranks: Array, excluded: Array) -> int:
	for rank in _sorted_desc(ranks):
		if not excluded.has(int(rank)):
			return int(rank)
	return 0


func _sorted_except(ranks: Array, excluded: Array) -> Array:
	var kept := []
	for rank in ranks:
		if not excluded.has(int(rank)):
			kept.append(int(rank))
	return _sorted_desc(kept)


func _evaluate_three_card_hand(cards: Array) -> Dictionary:
	var ranks := []
	var suits := []
	var rank_counts := {}
	for card_value in cards:
		var card: Dictionary = card_value
		var rank := int(card["rank"])
		ranks.append(rank)
		suits.append(str(card["suit"]))
		rank_counts[rank] = int(rank_counts.get(rank, 0)) + 1

	ranks.sort()
	var is_flush: bool = suits.size() == 3 and suits[0] == suits[1] and suits[1] == suits[2]
	var straight_high := _three_card_straight_high(ranks)
	var is_straight := straight_high > 0
	var counts := rank_counts.values()
	var name := "High Card"
	var category := 0
	var tiebreakers := _sorted_desc(ranks)

	if is_flush and is_straight:
		name = "Straight Flush"
		category = 5
		tiebreakers = [straight_high]
	elif counts.has(3):
		name = "Three of a Kind"
		category = 4
		tiebreakers = [_rank_with_count(rank_counts, 3)]
	elif is_straight:
		name = "Straight"
		category = 3
		tiebreakers = [straight_high]
	elif is_flush:
		name = "Flush"
		category = 2
	elif counts.has(2):
		name = "Pair"
		category = 1
		var pair_rank := _rank_with_count(rank_counts, 2)
		tiebreakers = [pair_rank]
		for rank in _sorted_desc(ranks):
			if rank != pair_rank:
				tiebreakers.append(rank)
	else:
		tiebreakers = _sorted_desc(ranks)

	return {
		"name": name,
		"category": category,
		"tiebreakers": tiebreakers,
	}


func _compare_three_card_hands(player_eval: Dictionary, dealer_eval: Dictionary) -> int:
	var player_category := int(player_eval["category"])
	var dealer_category := int(dealer_eval["category"])
	if player_category > dealer_category:
		return 1
	if player_category < dealer_category:
		return -1

	var player_breakers: Array = player_eval["tiebreakers"]
	var dealer_breakers: Array = dealer_eval["tiebreakers"]
	for i in range(0, min(player_breakers.size(), dealer_breakers.size())):
		if int(player_breakers[i]) > int(dealer_breakers[i]):
			return 1
		if int(player_breakers[i]) < int(dealer_breakers[i]):
			return -1
	return 0


func _three_card_dealer_qualifies(dealer_eval: Dictionary) -> bool:
	if int(dealer_eval["category"]) > 0:
		return true
	var tiebreakers: Array = dealer_eval["tiebreakers"]
	return not tiebreakers.is_empty() and int(tiebreakers[0]) >= 12


func _three_card_pair_plus_payout(player_eval: Dictionary) -> float:
	if three_card_current_pair_plus <= 0.0:
		return 0.0
	var hand_name := str(player_eval["name"])
	if not THREE_CARD_PAIR_PLUS_PAYOUTS.has(hand_name):
		return 0.0
	return three_card_current_pair_plus * float(int(THREE_CARD_PAIR_PLUS_PAYOUTS[hand_name]) + 1)


func _three_card_ante_bonus(player_eval: Dictionary) -> float:
	var hand_name := str(player_eval["name"])
	if not THREE_CARD_ANTE_BONUS.has(hand_name):
		return 0.0
	return three_card_current_ante * float(int(THREE_CARD_ANTE_BONUS[hand_name]))


func _get_three_card_strategy_tip() -> String:
	if three_card_player_cards.is_empty():
		return "Tip: deal a hand to get a Play/Fold suggestion."
	if not three_card_in_round:
		return "Tip: deal again for the next hand."

	var player_eval := _evaluate_three_card_hand(three_card_player_cards)
	if int(player_eval["category"]) > 0:
		return "Tip: Play. %s is worth continuing." % str(player_eval["name"])

	var tiebreakers: Array = player_eval["tiebreakers"]
	var q64_or_better := tiebreakers.size() == 3 and int(tiebreakers[0]) >= 12 and int(tiebreakers[1]) >= 6 and int(tiebreakers[2]) >= 4
	if q64_or_better:
		return "Tip: Play. Queen-6-4 or better is the usual cutoff."
	return "Tip: Fold. Below Queen-6-4 is usually too weak."


func _three_card_hand_label(name: String, cards: Array, hidden: bool) -> String:
	if cards.is_empty():
		return name
	if hidden:
		return "%s: hidden" % name
	var eval := _evaluate_three_card_hand(cards)
	return "%s: %s" % [name, str(eval["name"])]


func _three_card_straight_high(ranks: Array) -> int:
	var unique := []
	for rank in ranks:
		if not unique.has(rank):
			unique.append(rank)
	if unique.size() != 3:
		return 0
	if unique == [2, 3, 14]:
		return 3
	if int(unique[2]) - int(unique[0]) == 2:
		return int(unique[2])
	return 0


func _rank_with_count(rank_counts: Dictionary, count: int) -> int:
	for rank in rank_counts.keys():
		if int(rank_counts[rank]) == count:
			return int(rank)
	return 0


func _sorted_desc(values: Array) -> Array:
	var sorted := values.duplicate()
	sorted.sort()
	sorted.reverse()
	return sorted


func _get_poker_strategy_tip(cards: Array) -> Dictionary:
	if cards.size() != POKER_HAND_SIZE:
		return {}

	var all_cards := [0, 1, 2, 3, 4]
	var hand_name := str(_evaluate_poker_hand(cards)["hand"])
	if hand_name == "Royal Flush" or hand_name == "Straight Flush":
		return _build_poker_tip("Best made hand. Hold all five cards.", all_cards, cards)
	if hand_name == "Four of a Kind":
		return _build_poker_tip("Hold the four of a kind and draw one.", _indices_for_rank_count(cards, 4), cards)

	var four_royal := _royal_flush_draw_indices(cards, 4)
	if not four_royal.is_empty():
		return _build_poker_tip("Strong draw. Hold four to a Royal Flush.", four_royal, cards)

	if hand_name == "Full House" or hand_name == "Flush" or hand_name == "Straight":
		return _build_poker_tip("Made paying hand. Hold all five cards.", all_cards, cards)
	if hand_name == "Three of a Kind":
		return _build_poker_tip("Hold the three of a kind and draw two.", _indices_for_rank_count(cards, 3), cards)

	var straight_flush_draw := _straight_flush_draw_indices(cards)
	if not straight_flush_draw.is_empty():
		return _build_poker_tip("Good draw. Hold four to a Straight Flush.", straight_flush_draw, cards)
	if hand_name == "Two Pair":
		return _build_poker_tip("Hold both pairs and draw one.", _indices_for_all_pairs(cards), cards)
	if hand_name == "Jacks or Better":
		return _build_poker_tip("Hold the high pair.", _indices_for_high_pair(cards), cards)

	var three_royal := _royal_flush_draw_indices(cards, 3)
	if not three_royal.is_empty():
		return _build_poker_tip("Worth chasing. Hold three to a Royal Flush.", three_royal, cards)

	var flush_draw := _flush_draw_indices(cards)
	if not flush_draw.is_empty():
		return _build_poker_tip("Hold four to a Flush.", flush_draw, cards)

	var low_pair := _indices_for_rank_count(cards, 2)
	if not low_pair.is_empty():
		return _build_poker_tip("Hold the pair and draw three.", low_pair, cards)

	var outside_straight := _outside_straight_draw_indices(cards)
	if not outside_straight.is_empty():
		return _build_poker_tip("Hold four to an outside Straight.", outside_straight, cards)

	var high_suited := _suited_high_card_indices(cards)
	if high_suited.size() >= 2:
		return _build_poker_tip("Hold the two suited high cards.", high_suited, cards)

	var high_cards := _high_card_indices(cards)
	if not high_cards.is_empty():
		return _build_poker_tip("No strong draw. Hold the highest card.", [high_cards[0]], cards)

	return _build_poker_tip("No strong keep. Draw five new cards.", [], cards)


func _build_poker_tip(reason: String, holds: Array, cards: Array) -> Dictionary:
	if holds.is_empty():
		return {
			"text": "Tip: %s" % reason,
			"holds": holds,
		}

	return {
		"text": "Tip: %s Hold %s." % [reason, _format_poker_hold_cards(holds, cards)],
		"holds": holds,
	}


func _get_poker_card_texture(card: Dictionary) -> Texture2D:
	var path := str(card.get("image_path", ""))
	if path.is_empty():
		return null
	if poker_card_textures.has(path):
		return poker_card_textures[path]

	var texture: Texture2D = null
	if ResourceLoader.exists(path):
		texture = load(path)
	if texture == null and FileAccess.file_exists(path):
		var image := Image.load_from_file(path)
		if image != null and not image.is_empty():
			texture = ImageTexture.create_from_image(image)
	poker_card_textures[path] = texture
	return texture


func _poker_card_image_path(suit: String, rank: int) -> String:
	var prefix := _poker_suit_file_prefix(suit)
	var index := _poker_rank_file_index(rank)
	return "%s/%s_%04d_%s.png" % [POKER_CARD_DIR, prefix, index, _rank_label(rank)]


func _poker_suit_file_prefix(suit: String) -> String:
	match suit:
		"S":
			return "SPADES"
		"H":
			return "Hearts"
		"D":
			return "DIAMONDS"
		"C":
			return "CLUBS"
	return suit


func _poker_rank_file_index(rank: int) -> int:
	if rank == 14:
		return 0
	return rank - 1


func _indices_for_rank_count(cards: Array, count: int) -> Array:
	var rank_indices := _rank_indices(cards)
	for rank in rank_indices.keys():
		var indices: Array = rank_indices[rank]
		if indices.size() == count:
			return indices
	return []


func _indices_for_all_pairs(cards: Array) -> Array:
	var holds := []
	var rank_indices := _rank_indices(cards)
	for rank in rank_indices.keys():
		var indices: Array = rank_indices[rank]
		if indices.size() == 2:
			holds.append_array(indices)
	holds.sort()
	return holds


func _indices_for_high_pair(cards: Array) -> Array:
	var rank_indices := _rank_indices(cards)
	for rank in rank_indices.keys():
		var indices: Array = rank_indices[rank]
		if int(rank) >= 11 and indices.size() == 2:
			return indices
	return []


func _royal_flush_draw_indices(cards: Array, needed: int) -> Array:
	var royal_ranks := [10, 11, 12, 13, 14]
	for suit in POKER_SUITS:
		var indices := []
		for i in cards.size():
			var card: Dictionary = cards[i]
			if str(card["suit"]) == suit and royal_ranks.has(int(card["rank"])):
				indices.append(i)
		if indices.size() >= needed:
			return indices.slice(0, needed)
	return []


func _straight_flush_draw_indices(cards: Array) -> Array:
	for suit in POKER_SUITS:
		var suited_indices := []
		for i in cards.size():
			var card: Dictionary = cards[i]
			if str(card["suit"]) == suit:
				suited_indices.append(i)
		var combo := _first_four_card_straight_draw(cards, suited_indices)
		if not combo.is_empty():
			return combo
	return []


func _flush_draw_indices(cards: Array) -> Array:
	for suit in POKER_SUITS:
		var indices := []
		for i in cards.size():
			var card: Dictionary = cards[i]
			if str(card["suit"]) == suit:
				indices.append(i)
		if indices.size() >= 4:
			return indices.slice(0, 4)
	return []


func _outside_straight_draw_indices(cards: Array) -> Array:
	return _first_four_card_straight_draw(cards, [0, 1, 2, 3, 4], true)


func _suited_high_card_indices(cards: Array) -> Array:
	for suit in POKER_SUITS:
		var indices := []
		for i in cards.size():
			var card: Dictionary = cards[i]
			if str(card["suit"]) == suit and int(card["rank"]) >= 11:
				indices.append(i)
		if indices.size() >= 2:
			return indices.slice(0, 2)
	return []


func _high_card_indices(cards: Array) -> Array:
	var indices := []
	for i in cards.size():
		var card: Dictionary = cards[i]
		if int(card["rank"]) >= 11:
			indices.append(i)
	indices.sort_custom(func(a, b) -> bool:
		return int(cards[a]["rank"]) > int(cards[b]["rank"])
	)
	return indices


func _first_four_card_straight_draw(cards: Array, candidate_indices: Array, outside_only := false) -> Array:
	if candidate_indices.size() < 4:
		return []

	for a in range(0, candidate_indices.size() - 3):
		for b in range(a + 1, candidate_indices.size() - 2):
			for c in range(b + 1, candidate_indices.size() - 1):
				for d in range(c + 1, candidate_indices.size()):
					var combo := [
						candidate_indices[a],
						candidate_indices[b],
						candidate_indices[c],
						candidate_indices[d],
					]
					if outside_only:
						if _is_outside_straight_draw(cards, combo):
							return combo
					elif _is_straight_draw(cards, combo):
						return combo
	return []


func _is_straight_draw(cards: Array, indices: Array) -> bool:
	var ranks := _unique_ranks_for_indices(cards, indices)
	if ranks.size() != 4:
		return false

	for straight in _straight_rank_sets():
		var hits := 0
		for rank in ranks:
			if straight.has(rank):
				hits += 1
		if hits == 4:
			return true
	return false


func _is_outside_straight_draw(cards: Array, indices: Array) -> bool:
	var ranks := _unique_ranks_for_indices(cards, indices)
	if ranks.size() != 4:
		return false
	ranks.sort()
	return int(ranks[3]) - int(ranks[0]) == 3


func _straight_rank_sets() -> Array:
	return [
		[14, 2, 3, 4, 5],
		[2, 3, 4, 5, 6],
		[3, 4, 5, 6, 7],
		[4, 5, 6, 7, 8],
		[5, 6, 7, 8, 9],
		[6, 7, 8, 9, 10],
		[7, 8, 9, 10, 11],
		[8, 9, 10, 11, 12],
		[9, 10, 11, 12, 13],
		[10, 11, 12, 13, 14],
	]


func _unique_ranks_for_indices(cards: Array, indices: Array) -> Array:
	var ranks := []
	for index in indices:
		var card: Dictionary = cards[index]
		var rank := int(card["rank"])
		if not ranks.has(rank):
			ranks.append(rank)
	return ranks


func _rank_indices(cards: Array) -> Dictionary:
	var rank_indices := {}
	for i in cards.size():
		var card: Dictionary = cards[i]
		var rank := int(card["rank"])
		if not rank_indices.has(rank):
			rank_indices[rank] = []
		rank_indices[rank].append(i)
	return rank_indices


func _evaluate_poker_hand(cards: Array) -> Dictionary:
	var ranks := []
	var suits := []
	var rank_counts := {}
	for card_value in cards:
		var card: Dictionary = card_value
		var rank := int(card["rank"])
		ranks.append(rank)
		suits.append(str(card["suit"]))
		rank_counts[rank] = int(rank_counts.get(rank, 0)) + 1

	ranks.sort()
	var is_flush := true
	for suit in suits:
		if suit != suits[0]:
			is_flush = false
			break

	var unique_ranks := []
	for rank in ranks:
		if not unique_ranks.has(rank):
			unique_ranks.append(rank)

	var is_wheel := unique_ranks == [2, 3, 4, 5, 14]
	var high_rank := int(unique_ranks[unique_ranks.size() - 1])
	var low_rank := int(unique_ranks[0])
	var is_straight := unique_ranks.size() == POKER_HAND_SIZE and (high_rank - low_rank == 4 or is_wheel)
	var count_values := []
	for count in rank_counts.values():
		count_values.append(int(count))
	count_values.sort()
	count_values.reverse()

	var hand_name := "Nothing"
	if is_flush and unique_ranks == [10, 11, 12, 13, 14]:
		hand_name = "Royal Flush"
	elif is_flush and is_straight:
		hand_name = "Straight Flush"
	elif count_values[0] == 4:
		hand_name = "Four of a Kind"
	elif count_values[0] == 3 and count_values.size() > 1 and count_values[1] == 2:
		hand_name = "Full House"
	elif is_flush:
		hand_name = "Flush"
	elif is_straight:
		hand_name = "Straight"
	elif count_values[0] == 3:
		hand_name = "Three of a Kind"
	elif count_values[0] == 2 and count_values.size() > 1 and count_values[1] == 2:
		hand_name = "Two Pair"
	elif _has_jacks_or_better_pair(rank_counts):
		hand_name = "Jacks or Better"

	return {
		"hand": hand_name,
		"multiplier": int(POKER_PAYOUTS[hand_name]),
	}


func _has_jacks_or_better_pair(rank_counts: Dictionary) -> bool:
	for rank in rank_counts.keys():
		if int(rank) >= 11 and int(rank_counts[rank]) == 2:
			return true
	return false


func _count_matches(picks: Array, draw: Array) -> int:
	var matches := 0
	for number in picks:
		if draw.has(number):
			matches += 1
	return matches


func _get_payout_multiplier(spots: int, matches: int) -> int:
	if not PAYOUT_TABLE.has(spots):
		return 0
	var row: Dictionary = PAYOUT_TABLE[spots]
	return int(row.get(matches, 0))


func _owners_for_number(number: int) -> Array:
	var owners := []
	for i in CARD_COUNT:
		if card_picks[i].has(number):
			owners.append(i)
	return owners


func _get_hot_numbers(count: int) -> Array:
	var numbers := _numbers_sorted_by_hits(false)
	return numbers.slice(0, min(count, numbers.size()))


func _get_cold_numbers(count: int) -> Array:
	var numbers := _numbers_sorted_by_hits(true)
	return numbers.slice(0, min(count, numbers.size()))


func _numbers_sorted_by_hits(ascending: bool) -> Array:
	var numbers := []
	for number in range(1, NUMBER_MAX + 1):
		numbers.append(number)
	numbers.sort_custom(func(a, b) -> bool:
		if number_hit_counts[a] == number_hit_counts[b]:
			return a < b
		if ascending:
			return number_hit_counts[a] < number_hit_counts[b]
		return number_hit_counts[a] > number_hit_counts[b]
	)
	return numbers


func _format_count_list(numbers: Array) -> String:
	var parts := []
	for number in numbers:
		parts.append("%d (%d)" % [number, number_hit_counts[number]])
	return ", ".join(parts)


func _format_hit_tally() -> String:
	if hit_tally.is_empty():
		return "Hit Tally: no card results yet."

	var spots_played := hit_tally.keys()
	spots_played.sort()

	var lines := ["Hit Tally (all played cards):"]
	for spots in spots_played:
		var spot_tally: Dictionary = hit_tally[spots]
		var plays := 0
		for matches in range(0, int(spots) + 1):
			plays += int(spot_tally.get(matches, 0))

		lines.append("%d-spot, %d plays" % [int(spots), plays])

		var match_parts := []
		for matches in range(int(spots), -1, -1):
			match_parts.append("%d/%d: %d" % [
				matches,
				int(spots),
				int(spot_tally.get(matches, 0)),
			])
		lines.append("  %s" % ", ".join(match_parts))

	return "\n".join(lines)


func _card_label(index: int) -> String:
	if index >= 0 and index < CARD_LABELS.size():
		return CARD_LABELS[index]
	return str(index + 1)


func _format_card_pick_text(picks: Array) -> String:
	if picks.is_empty():
		return ""

	var first_line := []
	var second_line := []
	for i in picks.size():
		if i < 5:
			first_line.append(str(picks[i]))
		else:
			second_line.append(str(picks[i]))

	if second_line.is_empty():
		return ", ".join(first_line)
	return "%s\n%s" % [", ".join(first_line), ", ".join(second_line)]


func _format_recent_runs_tally() -> String:
	if recent_runs.is_empty():
		return "Last 100 runs: no runs yet."

	var total_hits := 0
	var total_won := 0.0
	var total_net := 0.0
	for run_value in recent_runs:
		var run: Dictionary = run_value
		total_hits += int(run["hits"])
		total_won += float(run["paid"])
		total_net += float(run["net"])

	var lines := []
	lines.append("Last %d runs: %d hits, won $%.2f, net %s" % [
		recent_runs.size(),
		total_hits,
		total_won,
		_format_signed_money(total_net),
	])

	var start_index := recent_runs.size() - 12
	if start_index < 0:
		start_index = 0

	lines.append("Recent:")
	for i in range(recent_runs.size() - 1, start_index - 1, -1):
		var run: Dictionary = recent_runs[i]
		lines.append("R%d: %d hits, won $%.2f, net %s" % [
			int(run["round"]),
			int(run["hits"]),
			float(run["paid"]),
			_format_signed_money(float(run["net"])),
		])

	return "\n".join(lines)


func _format_signed_money(value: float) -> String:
	if value >= 0.0:
		return "+$%.2f" % value
	return "-$%.2f" % abs(value)


func _format_signed_whole(value: float) -> String:
	if value >= 0.0:
		return "+%.0f" % value
	return "%.0f" % value


func _stringify_numbers(numbers: Array, limit: int) -> Array:
	var parts := []
	var max_count: int = min(limit, numbers.size())
	for i in max_count:
		parts.append(str(numbers[i]))
	if numbers.size() > limit:
		parts.append("...")
	return parts


func _number_tooltip(number: int, owners: Array, is_drawn: bool) -> String:
	var text := "Number %d" % number
	if not owners.is_empty():
		var cards := []
		for owner in owners:
			cards.append("Card %s" % _card_label(owner))
		text += "\nPicked on %s" % ", ".join(cards)
	if owners.size() > 1:
		text += "\n* means this number is picked on more than one card."
	if is_drawn:
		text += "\nHit in the last draw."
	text += "\nTotal hits: %d" % number_hit_counts[number]
	return text


func _format_payout_table() -> String:
	var lines := []
	for spots in range(1, 11):
		var row: Dictionary = PAYOUT_TABLE[spots]
		var hits := row.keys()
		hits.sort()
		var parts := []
		for hit_count in hits:
			parts.append("%d hit %.0fx" % [hit_count, row[hit_count]])
		lines.append("%d spot: %s" % [spots, ", ".join(parts)])
	return "\n".join(lines)


func _format_poker_paytable() -> String:
	var hands := [
		"Royal Flush",
		"Straight Flush",
		"Four of a Kind",
		"Full House",
		"Flush",
		"Straight",
		"Three of a Kind",
		"Two Pair",
		"Jacks or Better",
	]
	var lines := ["Paytable:"]
	for hand in hands:
		lines.append("%s: %.0fx" % [hand, POKER_PAYOUTS[hand]])
	lines.append("")
	lines.append("Cards held before Draw are kept.")
	return "\n".join(lines)


func _format_poker_hold_cards(indices: Array, cards: Array) -> String:
	var names := []
	for index in indices:
		var card: Dictionary = cards[index]
		names.append("%s of %s" % [_rank_label(int(card["rank"])), _poker_suit_name(str(card["suit"]))])
	return ", ".join(names)


func _rank_label(rank: int) -> String:
	match rank:
		11:
			return "J"
		12:
			return "Q"
		13:
			return "K"
		14:
			return "A"
	return str(rank)


func _rank_plural(rank: int) -> String:
	match rank:
		11:
			return "Jacks"
		12:
			return "Queens"
		13:
			return "Kings"
		14:
			return "Aces"
	return "%ds" % rank


func _poker_suit_color(suit: String) -> Color:
	if suit == "H" or suit == "D":
		return Color("#b02f34")
	return Color("#1d2329")


func _poker_suit_name(suit: String) -> String:
	match suit:
		"S":
			return "Spades"
		"H":
			return "Hearts"
		"D":
			return "Diamonds"
		"C":
			return "Clubs"
	return suit


func _poker_table_style() -> StyleBoxFlat:
	var style := StyleBoxFlat.new()
	style.bg_color = Color("#163f34")
	style.border_color = Color("#315f50")
	style.border_blend = true
	style.set_border_width_all(3)
	style.set_corner_radius_all(8)
	style.shadow_color = Color("#000000c0")
	style.shadow_size = 18
	style.shadow_offset = Vector2(7, 10)
	style.content_margin_left = 10
	style.content_margin_right = 10
	style.content_margin_top = 10
	style.content_margin_bottom = 12
	return style


func _craps_table_style() -> StyleBoxFlat:
	var style := StyleBoxFlat.new()
	style.bg_color = Color("#11523d")
	style.border_color = Color("#d4b45c")
	style.border_blend = true
	style.set_border_width_all(4)
	style.set_corner_radius_all(8)
	style.shadow_color = Color("#000000c8")
	style.shadow_size = 22
	style.shadow_offset = Vector2(8, 12)
	style.content_margin_left = 10
	style.content_margin_right = 10
	style.content_margin_top = 10
	style.content_margin_bottom = 12
	return style


func _craps_bet_spot_style(color: Color, border: Color, active := false, pressed := false) -> StyleBoxFlat:
	var style := StyleBoxFlat.new()
	style.bg_color = color.lightened(0.08) if active else color
	style.border_color = border
	style.border_blend = true
	style.set_border_width_all(4 if active else 2)
	style.set_corner_radius_all(7)
	style.shadow_color = Color("#000000bb")
	style.shadow_size = 8 if pressed else 18
	style.shadow_offset = Vector2(2, 4) if pressed else Vector2(7, 11)
	style.content_margin_left = 10
	style.content_margin_right = 10
	style.content_margin_top = 10 if pressed else 8
	style.content_margin_bottom = 8 if pressed else 10
	return style


func _apply_craps_zone_style(button: Button, has_chip: bool, disabled: bool) -> void:
	button.add_theme_stylebox_override("normal", _craps_zone_style(false, has_chip, disabled))
	button.add_theme_stylebox_override("hover", _craps_zone_style(true, has_chip, disabled))
	button.add_theme_stylebox_override("pressed", _craps_zone_style(true, true, disabled))
	button.add_theme_stylebox_override("disabled", _craps_zone_style(false, has_chip, true))
	var clear := Color(0, 0, 0, 0)
	button.add_theme_color_override("font_color", clear)
	button.add_theme_color_override("font_hover_color", clear)
	button.add_theme_color_override("font_pressed_color", clear)
	button.add_theme_color_override("font_disabled_color", clear)


func _craps_zone_style(hovered: bool, has_chip: bool, disabled: bool) -> StyleBoxFlat:
	var style := StyleBoxFlat.new()
	style.bg_color = Color("#f5d0671e") if hovered and not disabled else Color(0, 0, 0, 0)
	style.border_color = Color("#f5d067bf") if hovered and not disabled else Color(0, 0, 0, 0)
	if has_chip and not disabled:
		style.border_color = Color("#f5d06766")
	style.set_border_width_all(2 if hovered and not disabled else 0)
	style.set_corner_radius_all(10)
	return style


func _craps_chip_style() -> StyleBoxFlat:
	var style := StyleBoxFlat.new()
	style.bg_color = Color("#f8f3df")
	style.border_color = Color("#b61e2e")
	style.set_border_width_all(8)
	style.set_corner_radius_all(39)
	style.shadow_color = Color("#00000099")
	style.shadow_size = 14
	style.shadow_offset = Vector2(5, 8)
	style.content_margin_left = 4
	style.content_margin_right = 4
	style.content_margin_top = 4
	style.content_margin_bottom = 4
	return style


func _craps_selector_chip_style(selected: bool, pressed := false, disabled := false) -> StyleBoxFlat:
	var style := StyleBoxFlat.new()
	style.bg_color = Color("#f8f3df") if selected else Color("#3f4650dd")
	if disabled:
		style.bg_color = style.bg_color.darkened(0.22)
	style.border_color = Color("#f5d067") if selected else Color("#9aa4b2")
	style.set_border_width_all(5 if selected else 2)
	style.set_corner_radius_all(29)
	style.shadow_color = Color("#00000088")
	style.shadow_size = 7 if pressed else 13
	style.shadow_offset = Vector2(2, 4) if pressed else Vector2(5, 8)
	style.content_margin_left = 6
	style.content_margin_right = 6
	style.content_margin_top = 6
	style.content_margin_bottom = 6
	return style


func _craps_point_style(active: bool) -> StyleBoxFlat:
	var style := StyleBoxFlat.new()
	style.bg_color = Color("#f5d067") if active else Color("#1c2c29")
	style.border_color = Color("#fff4bd") if active else Color("#51766b")
	style.border_blend = true
	style.set_border_width_all(3 if active else 2)
	style.set_corner_radius_all(21)
	style.shadow_color = Color("#f5d06790") if active else Color("#00000088")
	style.shadow_size = 14 if active else 6
	style.shadow_offset = Vector2.ZERO if active else Vector2(2, 4)
	style.content_margin_left = 8
	style.content_margin_right = 8
	style.content_margin_top = 5
	style.content_margin_bottom = 5
	return style


func _poker_card_style(color: Color, border: Color, border_width: int, held := false, pressed := false) -> StyleBoxFlat:
	var style := StyleBoxFlat.new()
	style.bg_color = color
	style.border_color = border.lightened(0.2)
	style.border_blend = true
	style.set_border_width_all(max(border_width, 2))
	style.set_corner_radius_all(7)
	style.shadow_color = Color("#000000c4")
	style.shadow_size = 12 if pressed else 24
	style.shadow_offset = Vector2(4, 6) if pressed else Vector2(12, 18)
	if held:
		style.shadow_color = Color("#000000dc")
		style.shadow_size = 30 if not pressed else 16
		style.shadow_offset = Vector2(14, 22) if not pressed else Vector2(5, 8)
	style.content_margin_left = 8
	style.content_margin_right = 8
	style.content_margin_top = 8
	style.content_margin_bottom = 8
	return style


func _poker_action_button_style(color: Color, border: Color, active := true, pressed := false) -> StyleBoxFlat:
	var style := StyleBoxFlat.new()
	style.bg_color = color
	style.border_color = border.lightened(0.12)
	style.border_blend = true
	style.set_border_width_all(3 if active else 2)
	style.set_corner_radius_all(8)
	style.shadow_color = Color("#000000aa") if active else Color("#00000066")
	style.shadow_size = 7 if pressed else 16
	style.shadow_offset = Vector2(2, 3) if pressed else Vector2(6, 9)
	style.content_margin_left = 16
	style.content_margin_right = 16
	style.content_margin_top = 9 if pressed else 7
	style.content_margin_bottom = 7 if pressed else 9
	return style


func _panel_style(color: Color) -> StyleBoxFlat:
	var style := StyleBoxFlat.new()
	style.bg_color = color
	style.border_color = color.lightened(0.28)
	style.border_blend = true
	style.set_border_width_all(2)
	style.set_corner_radius_all(8)
	style.shadow_color = Color("#00000099")
	style.shadow_size = 12
	style.shadow_offset = Vector2(5, 7)
	style.content_margin_left = 6
	style.content_margin_right = 6
	style.content_margin_top = 6
	style.content_margin_bottom = 6
	return style


func _button_style(color: Color, border: Color, border_width: int, pressed := false) -> StyleBoxFlat:
	var style := StyleBoxFlat.new()
	style.bg_color = color
	style.border_color = border.lightened(0.18)
	style.border_blend = true
	style.set_border_width_all(max(border_width, 2))
	style.set_corner_radius_all(6)
	style.shadow_color = Color("#00000088")
	style.shadow_size = 2 if pressed else 7
	style.shadow_offset = Vector2(1, 1) if pressed else Vector2(3, 5)
	style.content_margin_left = 6
	style.content_margin_right = 6
	style.content_margin_top = 5 if pressed else 3
	style.content_margin_bottom = 3 if pressed else 5
	return style


func _keno_tube_style() -> StyleBoxFlat:
	var style := StyleBoxFlat.new()
	style.bg_color = Color("#53606e")
	style.border_color = Color("#c2ccd8")
	style.border_blend = true
	style.set_border_width_all(3)
	style.set_corner_radius_all(17)
	style.shadow_color = Color("#00000099")
	style.shadow_size = 10
	style.shadow_offset = Vector2(4, 6)
	return style


func _keno_spout_style() -> StyleBoxFlat:
	var style := StyleBoxFlat.new()
	style.bg_color = Color("#3b4654")
	style.border_color = Color("#a8b4c4")
	style.border_blend = true
	style.set_border_width_all(3)
	style.set_corner_radius_all(10)
	style.shadow_color = Color("#00000088")
	style.shadow_size = 8
	style.shadow_offset = Vector2(3, 5)
	return style


func _keno_ball_style(color: Color, border: Color, matched: bool) -> StyleBoxFlat:
	var style := StyleBoxFlat.new()
	style.bg_color = color
	style.border_color = border
	style.border_blend = true
	style.set_border_width_all(3 if matched else 2)
	style.set_corner_radius_all(KENO_BALL_SIZE / 2)
	style.shadow_color = Color("#000000aa")
	style.shadow_size = 12 if matched else 8
	style.shadow_offset = Vector2(3, 5)
	style.content_margin_left = 4
	style.content_margin_right = 4
	style.content_margin_top = 4
	style.content_margin_bottom = 4
	return style


func _keno_ball_match_ring_style() -> StyleBoxFlat:
	var style := StyleBoxFlat.new()
	style.bg_color = Color("#27b86c66")
	style.border_color = Color("#f5d067")
	style.border_blend = true
	style.set_border_width_all(4)
	style.set_corner_radius_all(KENO_BALL_SIZE / 2)
	style.shadow_color = Color("#f5d067aa")
	style.shadow_size = 14
	style.shadow_offset = Vector2.ZERO
	return style


func _keno_board_button_style(color: Color, border: Color, border_width: int, pressed := false) -> StyleBoxFlat:
	var style := StyleBoxFlat.new()
	style.bg_color = color
	style.border_color = border
	style.border_blend = true
	style.set_border_width_all(border_width)
	style.set_corner_radius_all(2)
	style.shadow_color = Color("#00000088") if color.a > 0.0 else Color("#00000000")
	style.shadow_size = 4 if color.a > 0.0 else 0
	style.shadow_offset = Vector2(1, 2) if pressed else Vector2.ZERO
	style.content_margin_left = 0
	style.content_margin_right = 0
	style.content_margin_top = 0
	style.content_margin_bottom = 0
	return style


func _invert_color(color: Color) -> Color:
	return Color(1.0 - color.r, 1.0 - color.g, 1.0 - color.b, color.a)


func _apply_text_depth(label: Label) -> void:
	label.add_theme_color_override("font_shadow_color", Color("#000000aa"))
	label.add_theme_constant_override("shadow_offset_x", 2)
	label.add_theme_constant_override("shadow_offset_y", 2)


func _apply_button_text_depth(button: Button) -> void:
	button.add_theme_color_override("font_shadow_color", Color("#000000bb"))
	button.add_theme_constant_override("shadow_offset_x", 2)
	button.add_theme_constant_override("shadow_offset_y", 2)


func _refresh_auto_play_button(playing: bool) -> void:
	if auto_play_button == null:
		return

	auto_play_button.text = "Stop Auto" if playing else "Auto Play"
	var bg := Color("#b63e3e") if playing else Color("#2f8f5b")
	auto_play_button.add_theme_stylebox_override("normal", _button_style(bg, Color("#00000044"), 2))
	auto_play_button.add_theme_stylebox_override("hover", _button_style(bg.lightened(0.08), Color("#f6f0df"), 2))
	auto_play_button.add_theme_stylebox_override("pressed", _button_style(bg.darkened(0.1), Color("#ffffff"), 3, true))
	auto_play_button.add_theme_color_override("font_color", Color("#ffffff"))
