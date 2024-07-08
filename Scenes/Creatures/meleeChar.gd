extends CharacterBody2D

@export var speed : float = 149
@export var health : int
@export var target: Node2D
@onready var nav_agent := $NavigationAgent2D as NavigationAgent2D
@onready var update_nav_timer := $update_nav_timer
@onready var melee_atack_cd := $meleeAttackTimer
@onready var animation_player = $AnimationPlayer

@onready var animated_sprite_2d = $Sprite2D


var target_aquired : bool = false
var target_dead : bool = false
var off_set_from_target : Vector2

# will make it go towards center of target and stop when with a certain distance of contatnt with collsion

func _ready():
	animated_sprite_2d.play("default")
	animation_player.play("spawn_animation");
	
	if (target == null):
		target_dead = true
		update_nav_timer.stop()
		melee_atack_cd.stop()
		return
	var col_shape : CollisionShape2D
	col_shape =  target.get_node("HitboxComponent").get_child(0)
	var extra = 120
	var target_width = col_shape.shape.extents.x / 2 + extra
	off_set_from_target = position.direction_to(target.position) * target_width / 2
	print(off_set_from_target)
	make_new_path()

	
func _physics_process(delta: float) -> void:
	
	if (target == null):
		animated_sprite_2d.play("default")
		target_dead = true
		update_nav_timer.stop()
		melee_atack_cd.stop()
		return
	elif not target_aquired:
		animated_sprite_2d.play("running")
		var dir = to_local(nav_agent.get_next_path_position()).normalized()
		velocity = dir * speed
		
		move_and_slide()
	
	
func make_new_path() -> void:
	if(target != null):
		nav_agent.target_position = target.global_position - off_set_from_target
	#if !nav_agent.is_target_reachable():
		#print("target is not reachable for melee character")
func _on_update_nav_timer_timeout():
	if not target_aquired:
		make_new_path()
	else:
		update_nav_timer.stop()
	
func _on_melee_attack_timer_timeout():
	var target_childs = target.get_children()
	for child in target_childs:
		if child is HitboxComponent:
			var attack = Attack.new()
			attack.attack_damadge = 500
			child.damage(attack)
	
func _on_area_2d_area_entered(area):
	if area.get_parent() == target:
		target_aquired = true
		melee_atack_cd.start()
		_on_melee_attack_timer_timeout()

