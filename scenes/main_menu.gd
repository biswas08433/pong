extends Control

var l01 = "res://scenes/l_01.tscn"
@onready var color_rect_2: ColorRect = $ColorRect2
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

func _ready() -> void:
	GameManager.game_state = GameManager.START


func _on_start_button_pressed() -> void:
	process_mode = Node.PROCESS_MODE_DISABLED
	audio_stream_player.play()
	GameManager.game_state = GameManager.READY
	await GameManager.change_scene(l01)


func _on_quit_button_pressed() -> void:
	get_tree().quit()




func _on_help_button_pressed() -> void:
	var tween = create_tween()
	tween.tween_property(color_rect_2, "scale", Vector2(1,1), 0.5)\
		.set_ease(Tween.EASE_OUT)\
		.set_trans(Tween.TRANS_ELASTIC)

func _on_help_cross_button_pressed() -> void:
	var tween = create_tween()
	tween.tween_property(color_rect_2, "scale", Vector2(0,0), 0.2)\
		.set_ease(Tween.EASE_IN)\
		.set_trans(Tween.TRANS_BACK)
