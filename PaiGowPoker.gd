extends Control

# Minimal Pai Gow Poker stub for integration

const GAME_NAME := "pai_gow_poker"

var deal_button: Button
var status_label: Label

func _ready():
    custom_minimum_size = Vector2(800, 600)
    var v = VBoxContainer.new()
    add_child(v)

    status_label = Label.new()
    status_label.text = "Pai Gow Poker (stub)"
    v.add_child(status_label)

    deal_button = Button.new()
    deal_button.text = "Deal"
    deal_button.pressed.connect(_on_deal_pressed)
    v.add_child(deal_button)

func _on_deal_pressed():
    status_label.text = "Dealt a hand (not implemented)"

func get_game_name():
    return GAME_NAME
