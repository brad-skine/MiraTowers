extends Node

var gameTime = 0

@onready var startingMoney = 100;

var new_tower_coords = Vector2i(150, 150)
var new_tower_grid_num = Vector2i(150, 150)
var ground_layer = 0
var hover_layer = 1
var player_active = "player1" # note not turn based game jsut will make it 
							  # easyer to test quickly


func _unhandled_input(event):
	if event is InputEventKey:
		if event.get_keycode() == KEY_C and not event.pressed :
			if player_active == "player1":
				player_active = "player2"
			else: 
				player_active = "player1"


	


#Clairvoyance

