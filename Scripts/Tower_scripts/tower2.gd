extends Tower


@export var t2_health = 0
@export var t2_fire_rate = 0
@export var t2_bullet_speed = 0


func _ready():
	
	health = t2_health
	fire_rate = t2_fire_rate
	bullet_speed = t2_bullet_speed
	super()

func _process(delta):
	rotate(deg_to_rad(2.2))


