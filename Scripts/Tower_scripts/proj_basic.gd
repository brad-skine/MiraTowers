extends CharacterBody2D


var speed = 100.0
var dir : float = 0.0
var init_pos : Vector2 = Vector2(0, 0)
var z_dex : int
var tower_damadge = 100

# Get the gravity from the project settings to be synced with RigidBody nodes.
func _ready():
	global_position = init_pos
	global_rotation = dir
	z_index = z_dex
func _physics_process(delta):
	velocity = Vector2(0, speed).rotated(dir)
	move_and_slide()

func _on_area_2d_body_entered(body):
	if body is HitboxComponent:
		var attack = Attack.new()
		attack.attack_damadge = tower_damadge
		body.damadge(attack)
	queue_free()


func _on_life_timeout():
	queue_free()


func _on_area_2d_area_entered(area):
	if area is HitboxComponent:
		var attack = Attack.new()
		attack.attack_damadge = tower_damadge
		area.damage(attack)
		queue_free()
