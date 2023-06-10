extends CharacterBody2D

const HALF_WIDTH = 1920/2.0
const HALF_HEIGHT = 1080/2.0

signal score_changed(player)

var ball_sounds = BallSounds.new()
@onready var sound_player: Node = $SoundPlayer


var start_speed:float = 10.0
var y_sd = 0.3
var current_speed = start_speed
var vel_dir: Vector2
var resetted: bool = false

func _physics_process(delta: float) -> void:
	if GameManager.game_state == GameManager.READY and !resetted:
		position = Vector2(HALF_WIDTH, HALF_HEIGHT)
		vel_dir.x = -1 if randf() > 0.5 else 1
		vel_dir.y = randf_range(-0.6, 0.6)
		current_speed = start_speed
		resetted = true
	elif GameManager.game_state == GameManager.PLAYING:
		var collision = move_and_collide(vel_dir*current_speed*delta*60)
		if collision:
			var col_object = collision.get_collider() as Node
			var col_index = collision.get_collider_shape_index()
			if (col_object.is_in_group("wall")):
				if	(col_index == 2 or col_index == 3):
					score_changed.emit("left" if col_index==3 else "right")
					sound_player.play(ball_sounds.reset_sound)
					GameManager.game_state = GameManager.READY
					resetted = false
					return
				else:
					if position.x > HALF_WIDTH:
						sound_player.play(ball_sounds.right_wall_sounds[randi_range(0,2)])
					else:
						sound_player.play(ball_sounds.left_wall_sounds[randi_range(0,2)])
			elif col_object.is_in_group("player"):
				col_object.acc *= 1.01
				col_object.speed *= 1.01
				if col_object.get_side() == -1:
					sound_player.play(ball_sounds.left_paddle_sounds[randi_range(0,5)])
				else:
					sound_player.play(ball_sounds.right_paddle_sounds[randi_range(0,5)])
			vel_dir = vel_dir.bounce(collision.get_normal())
			vel_dir.y += randf_range(-0.4, 0.4)
			current_speed *= 1.001

func reset():
	sound_player.play(ball_sounds.restart_sound)
	GameManager.game_state = GameManager.READY
	resetted = false
	return

func play_win_sound():
	sound_player.play(ball_sounds.win_sound)
