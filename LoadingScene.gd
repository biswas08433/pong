extends CanvasLayer
@onready var color_rect: ColorRect = $ColorRect
@onready var sprite_2d: Sprite2D = $Sprite2D

var color_rect_mat: ShaderMaterial
var sprite_rot_tween


func _ready() -> void:
	color_rect_mat = color_rect.material
#	cover()
#	await get_tree().create_timer(3).timeout
#	uncover()

func cover():
	var tween = create_tween()
	tween.tween_property(color_rect_mat, "shader_parameter/progress", 1, 1)
	tween.tween_interval(0.5)
	tween.tween_property(sprite_2d, "scale", Vector2(1,1), 0.5) \
		.set_ease(Tween.EASE_OUT) \
		.set_trans(Tween.TRANS_BACK)
	sprite_rot_tween = create_tween().set_loops()
	sprite_rot_tween.tween_property(sprite_2d, "rotation", 0.7854, 1) \
		.as_relative() \
		.set_ease(Tween.EASE_OUT) \
		.set_trans(Tween.TRANS_ELASTIC)
	await tween.finished

func uncover():
	var tween = create_tween()
	tween.tween_property(sprite_2d, "scale", Vector2(0,0), 0.5) \
		.set_ease(Tween.EASE_IN) \
		.set_trans(Tween.TRANS_BACK)
	tween.tween_interval(0.5)
	tween.tween_property(color_rect_mat, "shader_parameter/progress", 0, 1)
	await  tween.finished



