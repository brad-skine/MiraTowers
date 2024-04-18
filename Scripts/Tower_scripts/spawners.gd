extends Node2D

class_name Spawner
var stats: spawnerStats = null

@onready var health: int = stats.health
@onready var spawned_unit : PackedScene = stats.spawned_unit
@onready var health_label := $Label
@onready var sp := $tSprite/sP
@onready var spawn_timer := $spawnTimer
var tile_position : Vector2

func load_stats(s_stats: spawnerStats) -> void:
	stats = s_stats

func _ready():
	health_label.set_text(str(health))
	
func _on_tree_exiting():
	print("on tree _extiing")
	var tile_map = get_parent().get_child(0).get_child(0)
	# do above in a better way with get root, and not indexint
	tile_map.set_cell(0, tile_position, 2, Vector2i(0,0))

func update_health(new_health: int):
	health_label.set_text(str(new_health));
	health = new_health
	print(new_health)
	if health <= 0:
		queue_free()

func _on_initial_spawn_timer_timeout():
	spawn()
	spawn_timer.start()
func _on_spawn_timer_timeout():
	spawn()

func spawn():
	var new_creature_instance = spawned_unit.instantiate()
	new_creature_instance.position = to_global(sp.position)
	var children = get_parent().get_children()
	var new_target : Node2D
	for child in children:
		if child.name == "Base2":
			new_target = child
	if("target" in new_creature_instance):
		new_creature_instance.target = new_target
	get_parent().add_child(new_creature_instance)
	

	#func fire_projectile():
	#var projectile_instance = PROJECTILE_SCENE.instantiate() # Create
	#projectile_instance.init_pos = position + sp.position.rotated(rotation)
	
#
#func _on_cd_timeout():
	##print("hi")
	#fire_projectile()
	#
	


