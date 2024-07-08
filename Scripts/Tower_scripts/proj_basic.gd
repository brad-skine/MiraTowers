extends CharacterBody2D


var speed = 100.0
var dir : float = 0.0
var init_pos : Vector2 = Vector2(0, 0)
var z_dex : int
var tower_damadge = 100

var show_damage_scene = preload("res://Scripts/On_hit_effects/damadge_number_animation.tscn")

# Get the gravity from the project settings to be synced with RigidBody nodes.
func _ready():

	global_position = init_pos
	global_rotation = dir
	z_index = z_dex
func _physics_process(delta):
	velocity = Vector2(0, speed).rotated(dir)
	move_and_slide()


func _on_area_2d_area_entered(area):
	if area is HitboxComponent:
		var attack = Attack.new()
		attack.attack_damadge = tower_damadge
		area.damage(attack)
		
		var damage_instance = show_damage_scene.instantiate()
		damage_instance.position = position
		get_parent().add_child(damage_instance)
		damage_instance.show_damage(attack)
		
		queue_free()
	queue_free()

func _on_life_timeout():
	queue_free()

