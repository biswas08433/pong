class_name Player extends CharacterBody2D

enum SIDE { LEFT, RIGHT }
@export var speed: float = 50
@export var reset_position: Vector2 = Vector2.ZERO
@export var side: SIDE


var up_action: String
var down_action: String

var input: float
var vel: float = 0.0
var acc: float = 0.35
var friction: float = 0.3

func get_side() -> int:
	return -1 if side == SIDE.LEFT else 1


func _ready() -> void:
	if side == SIDE.LEFT:
		up_action = "LeftUp"
		down_action = "LeftDown"
	else:
		up_action = "RightUp"
		down_action = "RightDown"
	acc = acc * speed


func _physics_process(delta: float) -> void:
	input = Input.get_axis(up_action, down_action)
	vel += input*acc
	vel -= vel*0.8*0.5
	position.y += vel*delta*60
	position.y = clamp(position.y, 130, 950)

func reset():
	position = reset_position
