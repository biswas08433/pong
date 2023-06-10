class_name BallSounds extends Resource

var n_paddle = 6
var n_wall = 3


var left_paddle_sounds = []
var right_paddle_sounds = []
var left_wall_sounds = []
var right_wall_sounds = []

var reset_sound = preload("res://assets/sfx/general/restart.wav")
var restart_sound = preload("res://assets/sfx/general/game_restart.wav")
var win_sound = preload("res://assets/sfx/general/win.wav")

func _init() -> void:
	for i in n_paddle:
		var left_path = "res://assets/sfx/hit/pl"+str(i+1)+".wav"
		var right_path = "res://assets/sfx/hit/pr"+str(i+1)+".wav"
		left_paddle_sounds.append(load(left_path) as AudioStream)
		right_paddle_sounds.append(load(right_path) as AudioStream)
	for i in n_wall:
		var left_path =  "res://assets/sfx/wall_hit/wall_left_"+str(i+1)+".wav"
		var right_path = "res://assets/sfx/wall_hit/wall_right_"+str(i+1)+".wav"
		left_wall_sounds.append(load(left_path) as AudioStream)
		right_wall_sounds.append(load(right_path) as AudioStream)
