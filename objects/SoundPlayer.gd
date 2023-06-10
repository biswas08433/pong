extends Node

var num_players = 4
var bus = "master"

var available = []  # The available players.
var last = 0
func _ready():
	# Create the pool of AudioStreamPlayer nodes.
	for i in num_players:
		var p = AudioStreamPlayer.new()
		add_child(p)
		available.append(p)
		p.bus = bus
		p.volume_db = -6.0

func play(sound):
	available[last].stream = sound
	available[last].play()
	last += 1
	last %= num_players
