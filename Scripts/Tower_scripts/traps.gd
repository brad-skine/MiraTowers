extends Area2D


var stats: trapStats = null
var tile_position : Vector2
@onready var damage = stats.damage
@onready var label = $Label

func _ready():
	label.set_text(str(damage))
	
func load_stats(t_stats: trapStats) -> void:
	stats = t_stats
	
func _on_area_entered(area):
	if area is HitboxComponent:
		var attack = Attack.new()
		attack.attack_damadge = damage
		area.damage(attack)
		queue_free()

func _on_tree_exiting():
	var tile_map = get_parent().get_child(0).get_child(0)
	# do above in a better way with get root, and not indexint
	print(tile_map)
	tile_map.set_cell(0, tile_position, 2, Vector2i(0,0))