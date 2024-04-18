extends Node2D

class_name Tower

var stats: towerStats = null

@onready var health: int = stats.health
@onready var fire_rate = stats.fire_rate
@onready var bullet_speed = stats.bullet_speed

func load_stats(t_stats: towerStats) -> void:
	stats = t_stats

var tile_position : Vector2
var targets_in_range = {}

# will need upgrade menu
var PROJECTILE_SCENE = preload("res://Scenes/Towers/Projectiles/proj_basic.tscn")

@onready var sp := $sP
@onready var cd := $cd
func _ready():
	cd.wait_time = 1.0 / fire_rate
	#print("Health : %s" % health)
	#print("firerate: %s" % fire_rate)
	#print("bullet_speed: %s" % bullet_speed)
	
	#print(stats.health)
	#queue_free()
func _process(delta):
	# Update time since last fire
	pass
	
func fire_projectile():
	var projectile_instance = PROJECTILE_SCENE.instantiate() # Create
	projectile_instance.init_pos = position + sp.position.rotated(rotation)
	projectile_instance.dir = rotation
	projectile_instance.z_dex = z_index - 1
	projectile_instance.speed = bullet_speed
	get_parent().add_child(projectile_instance)

func _on_cd_timeout():
	#print("hi")
	fire_projectile()

func _on_range_body_entered(body):
	targets_in_range[body.name]= position.distance_to(body.position)


func _on_tree_exiting():
	var tile_map = get_parent().get_child(0).get_child(0)
	# do above in a better way with get root, and not indexint
	tile_map.set_cell(0, tile_position, 2, Vector2i(0,0))


