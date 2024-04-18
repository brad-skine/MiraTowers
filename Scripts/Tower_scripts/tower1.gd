extends Tower

#@export var t1_health = 0
#@export var t1_fire_rate = 0
#@export var t1_bullet_speed = 0

@onready var tSprite := $tSprite
func _ready():
	#health = t1_health
	#fire_rate = t1_fire_rate
	#bullet_speed = t1_bullet_speed
	super()

func _process(delta):
	rotate(deg_to_rad(0.1))


