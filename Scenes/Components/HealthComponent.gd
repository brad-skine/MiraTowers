extends Control

class_name HealthComponent 

var health : float

func _ready():
	health = get_parent().health
	
func get_health():
	return health
func damage(attack: Attack):  #TODO: make health label work
	var parent = get_parent()
	health = parent.health
	health -= attack.attack_damadge
	if (parent.has_method("update_health")):
		parent.update_health(health)
	else:
		if health <= 0:
			parent.queue_free()
		else:
			parent.health = health
			
	
