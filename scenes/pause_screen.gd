extends ColorRect

@onready var pause_text: Label = $MarginContainer/PauseText
@onready var help_text: Label = $MarginContainer/HelpText


func cover():
	help_text.visible = false
	pause_text.visible = true
	var t = create_tween()
	t.tween_property(self, "scale", Vector2(1,1), 0.5)\
		.set_ease(Tween.EASE_OUT)\
		.set_trans(Tween.TRANS_ELASTIC)
	await t.finished

func uncover():
	var t = create_tween()
	t.tween_property(self, "scale", Vector2(0,0), 0.3)\
		.set_ease(Tween.EASE_IN)\
		.set_trans(Tween.TRANS_BACK)
	await t.finished
	process_mode = Node.PROCESS_MODE_DISABLED

func _on_exit_button_pressed() -> void:
	get_tree().quit(0)


func _on_restart_button_pressed() -> void:
	GameManager.restart()
	await uncover()



func _on_help_button_pressed() -> void:
	help_text.visible = !help_text.visible
	pause_text.visible = !pause_text.visible
