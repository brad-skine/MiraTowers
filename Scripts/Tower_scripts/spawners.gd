extends tower_super_class

class_name Spawner

@onready var spawned_unit : PackedScene = stats.spawned_unit
@onready var health_label := $Label
@onready var sp := $tSprite/sP
@onready var spawn_timer := $spawnTimer

@onready var health_component = $HealthComponent

func _ready():
	print(stats.health)
	print("starting health", health)
	health_label.set_text(str(stats.health))
	
func _on_tree_exiting():
	print("exiting tree spawner")

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
	new_creature_instance.call_deferred("_ready")

	

	
	


