extends Node2D

# Called when the node enters the scene tree for the first time.
@onready var audio_stream_player_2d = $AudioStreamPlayer2D
@onready var animation_player = $AnimationPlayer
func _ready():
	Clock.show_clock()
	Clock.pause_play_clock()
	Player1.money_label = $money
	Player1.update_money_text()
	
	
	
func _process(delta):
	if not audio_stream_player_2d.playing:
		animation_player.play("music_animation_test")
		#animation_player.play("music_animation_test")

