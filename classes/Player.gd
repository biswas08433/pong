class_name Player extends CharacterBody2D

@export var speed: float = 20

enum SIDE { LEFT, RIGHT }
@export var side: SIDE = SIDE.LEFT

var up_action: String
var down_action: String

var input: float


func _ready() -> void:
	if side == SIDE.LEFT:
		up_action = "LeftUp"
		down_action = "LeftDown"
	else:
		up_action = "RightUp"
		down_action = "RightDown"


func _physics_process(delta: float) -> void:
	input = Input.get_axis(up_action, down_action)
	position.y += input*speed*delta*60
