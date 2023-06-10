extends Node2D

@onready var ready_prompt: Label = $bg/ReadyPrompt
@onready var score_box: HBoxContainer = $bg/ScoreContainer
@onready var ball: CharacterBody2D = $Ball
@onready var player_right: CharacterBody2D = $PlayerRight
@onready var player_left: CharacterBody2D = $PlayerLeft

var win_screen = preload("res://scenes/win_screen.tscn")
var win_screen_instance

var score_left: int = 0
var score_right: int = 0

func _ready() -> void:
	add_to_group("level")

func restart():
	ball.reset()
	player_right.reset()
	player_left.reset()
	score_reset()
	ready_prompt.visible = true
	process_mode = Node.PROCESS_MODE_INHERIT

func _unhandled_input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_accept") and \
			GameManager.game_state == GameManager.READY:
		GameManager.game_state = GameManager.PLAYING
		ready_prompt.visible = false

func _on_ball_score_changed(player) -> void:
	if player == "left":
		score_left += 1
	else:
		score_right += 1
	score_box.change_score(score_left, score_right)

	if score_left == 10 or score_right == 10:
		GameManager.game_state = GameManager.END
		win_screen_instance = win_screen.instantiate()
		get_tree().root.add_child(win_screen_instance)
		win_screen_instance.player(player)
		ball.play_win_sound()
		await win_screen_instance.cover()
		return
	ready_prompt.visible = true

func score_reset():
	score_left = 0
	score_right = 0
	score_box.change_score(score_left, score_right)

