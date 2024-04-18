extends Node2D

@onready var ground = $Ground
# Called when the node enters the scene tree for the first time.

func _ready():
	pass
var ground_layer = 0
var can_place_custom_data = "CanPlace"
var can_Upgrade_custom_data = "CanUpgrade"
var sand_grass_src_id : int = 1; 
var no_ground_src_id : int = -1;

func _input(_event: InputEvent):
	if Input.is_action_just_pressed("click"):
		var mouse_pos : Vector2 = (get_global_mouse_position())
		var tile_mouse_pos : Vector2i = ground.local_to_map(mouse_pos)
		#var atlas_coord : Vector2i = Vector2i(0,3)
		
		var new_tower_coords = Vector2(tile_mouse_pos[0] * 65 + 12, tile_mouse_pos[1] * 65 + 35.5)
		var tile_data : TileData = ground.get_cell_tile_data(ground_layer, tile_mouse_pos)
		
		if (tile_data):
			var can_place = tile_data.get_custom_data(can_place_custom_data)
			
			if can_place: 
				Global.new_tower_coords = new_tower_coords
				Global.new_tower_grid_num = tile_mouse_pos
				SceneManager.changeUi("res://Scenes/UI/BuyMenu.tscn")
			else:
				var can_upgrade = tile_data.get_custom_data(can_Upgrade_custom_data)
				if (can_upgrade):
					Global.new_tower_coords = new_tower_coords
					Global.new_tower_grid_num = tile_mouse_pos
					SceneManager.changeUi("res://Scenes/UI/tUpgradeMenu.tscn")
		else:
			pass
			#print("no tile there")


