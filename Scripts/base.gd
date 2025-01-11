extends Node2D

class_name Basee

@export var health = 0
@export var player = "player1"
const UPGRADE_MENU = preload("res://Scenes/UI/baseUpgradeMenu.tscn")
@onready var health_label = $Sprite2D/health
@onready var player_name = $player_name

func _ready():
	
	player_name.add_theme_color_override("font_color", Color(0.3, 0.0, 0.2, 1.0))
	if player == "player1":
		player_name.set_text("P1")
	else:
		player_name.set_text("P2")
	health_label.set_text(str(health));
	 # Update time since last fire
	
	
func _physics_process(delta):
	if player == Global.player_active:
		player_name.show()
	else:
		player_name.hide()

func _on_upgrade_button_pressed():
	if(SceneManager.current_ui_scene != UPGRADE_MENU):

		SceneManager.changeUi("res://Scenes/UI/baseUpgradeMenu.tscn")
	
#func _input(_event: InputEvent):
	#if Input.is_action_just_pressed("click"):
	
		#SceneManager.changeUi("res://Scenes/UI/buyMenu.tscn")

func damage(attack: Attack):

	health -= attack.attack_damadge
	
func update_health(new_health: int):
	$Sprite2D/health.set_text(str(new_health));
	health = new_health
	if health <= 0:
		queue_free()





	
