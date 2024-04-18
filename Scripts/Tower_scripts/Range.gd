extends Area2D

	
@onready var range:= $CollisionShape2D

func _draw():
	print("test")
	draw_circle(position,  range.shape.radius, Color(150,150, 222, 0.2) )
	draw_arc(position, range.shape.radius, 0, TAU, 300, Color(0, 0, 0, 0.9), 3.0)
	
