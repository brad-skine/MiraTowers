extends Node2D

class_name Basee

@export var health = 0

const UPGRADE_MENU = preload("res://Scenes/UI/baseUpgradeMenu.tscn")

func _ready():
	$Sprite2D/health.set_text(str(health));
	 # Update time since last fire

func _on_upgrade_button_pressed():
	if(SceneManager.current_ui_scene != UPGRADE_MENU):
		print("upgrade menu pressed")
		SceneManager.changeUi("res://Scenes/UI/baseUpgradeMenu.tscn")
	
#func _input(_event: InputEvent):
	#if Input.is_action_just_pressed("click"):
		#print("upgrade menu pressed")
		#SceneManager.changeUi("res://Scenes/UI/buyMenu.tscn")

func damage(attack: Attack):
	#print("hi")
	health -= attack.attack_damadge
	
func update_health(new_health: int):
	$Sprite2D/health.set_text(str(new_health));
	health = new_health
	if health <= 0:
		queue_free()





	
