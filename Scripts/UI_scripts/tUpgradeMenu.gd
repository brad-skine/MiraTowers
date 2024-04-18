extends GridHoverScript

##var tile_map =  TileMap
## Called when the node enters the scene tree for the first time.
#func _ready():
	#tile_map = get_parent().get_child(0).get_child(0)
	#tile_map.set_cell(1, Global.new_tower_grid_num, 3, Vector2i(0,0))
#
#func _on_tree_exiting():
	#tile_map.clear_layer(Global.hover_layer)

