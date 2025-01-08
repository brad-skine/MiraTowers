extends Node2D

# Called when the node enters the scene tree for the first time.
@onready var back_ground_player = $AudioStreamPlayer2D
@onready var animation_player = $AnimationPlayer
func _ready():
	Clock.show_clock()
	Clock.pause_play_clock()

	Player1.money_label = $money  #TODO: make so uses Player (works for 1 or 2)
	Player1.update_money_text()
		
	back_ground_player.play()
	
	
#func _process(delta):
	#if not audio_stream_player_2d.playing:
	#animation_player.play("music_animation_test")
		#animation_player.play("music_animation_test")


func _on_audio_stream_player_2d_finished():
	back_ground_player.play() # loop
