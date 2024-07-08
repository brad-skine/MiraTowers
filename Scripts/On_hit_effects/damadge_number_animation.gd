extends Node2D
class_name ShowDamage

@onready var label = $Label

var display_time : float = 1.0  # How long the damage number will be displayed
var elapsed_time : float = 0.0  # Time counter


func _ready():
	print("ready damage number")
	visible = false  # Hide the label initially
# This function will be called to show damage
func show_damage(attack: Attack):

	label.text = str(attack.attack_damadge)
	elapsed_time = 0.0
	visible = true  # Ensure the label is visible when damage is shown



func _process(delta):
	if visible:
		elapsed_time += delta
		if elapsed_time >= display_time:
			queue_free()
