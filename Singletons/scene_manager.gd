# SceneManager.switch_scene("res://level_1.tscn")
extends Node

var current_scene = null
var current_ui_scene = null
func _ready() -> void:
	var root = get_tree().root
	current_scene = root.get_child(root.get_child_count() - 1)

func change_scene(res_path):
	call_deferred("_deferred_switch_scene", res_path)
	
func _deferred_switch_scene(res_path):
	current_scene.free()
	var s = load(res_path)
	current_scene = s.instantiate()
	get_tree().root.add_child(current_scene)
	get_tree().current_scene = current_scene

func changeUi(res_path):
	call_deferred("_deffered_change_ui", res_path)

func _deffered_change_ui(res_path):
	var s = load(res_path)
	var new_scene = s.instantiate()
	new_scene.position = Vector2i(0, 0)
	if (current_ui_scene):
		current_ui_scene.free() #clears previous ui
	current_ui_scene = new_scene
	current_scene.add_child(new_scene)
	#print(new_scene)






