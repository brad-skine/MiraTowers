extends PhysicsBody2D

class_name tower_super_class
var stats: Resource = null
var tile_position : Vector2
var health : int
func _ready():
	if (stats != null):
		health = stats.health
	
	
func load_stats(s_stats: Resource) -> void: # will make a tower super class with this
	stats = s_stats

func _on_tree_exiting():
	print("on tree _extiing")
	var tile_map = get_parent().get_child(0).get_child(0)
	# do above in a better way with get root, and not indexint
	tile_map.set_cell(0, tile_position, 2, Vector2i(0,0))
