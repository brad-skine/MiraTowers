extends GridHoverScript

@onready var tower_selected
@onready var stats_selected
var can_Upgrade_custom_data = "CanUpgrade"
var ground_layer = 0;
var cur_selection = "none";
@onready var price_tag = $"TR/MC/VBC/Purchace Button/PriceTag"

@onready var towersCon := $TR/towersCon
@onready var spawnersCon := $TR/spawnersCon
@onready var trapsCon := $TR/trapsCon
@onready var money_con = $TR/moneyCon


func tree_exiting():
	pass
	
func _on_label_ready():
	$TR/Label.set_text("x: " + str(Global.new_tower_grid_num[0] - 4) +
	 " and y: " + str(Global.new_tower_grid_num[1] + 1))
	
func _on_purchace_button_pressed():
	cur_selection = "none"
	Player1.decrease_money(stats_selected.cost) #Todo
	#tile_map = get_parent().get_child(0).get_child(0)
	tile_map.set_cell(ground_layer, Global.new_tower_grid_num, 1, Vector2i(0,0))
	var tile_data : TileData = tile_map.get_cell_tile_data(ground_layer, Global.new_tower_grid_num)
	if (tile_data):
		tile_data.set_custom_data(can_Upgrade_custom_data, true)
	else:
		print("no tile found where purchacing, bug should never happen")
	var newTower = tower_selected.instantiate()
	newTower.load_stats(stats_selected)
	
	get_parent().add_child(newTower)
	newTower.position  = Global.new_tower_coords
	newTower.tile_position = Global.new_tower_grid_num
	SceneManager.changeUi("res://Scenes/UI/gameplay_menu.tscn")
	

var towers_information = {"header": "Towers", "info": "select what tower you would like to purchase"}


var spawners_information = {"header": "Spawners", "info": "Select what spawner you would like to purchase"}

var traps_information =  {"header": "Traps", "info": "Select what trap you would like to purchase"}

var money_maker_information =  {"header": "Money Makers", "info": "Select what $ maker you would like to purchase"}

var information = {"spawners": spawners_information, "towers": towers_information,
				  "$":  money_maker_information,	"traps": traps_information}
	
func load_new_tower(curent_selection: String, index: int) -> void:

	var cur_sel = curent_selection + str(index)
	tower_selected = load("res://Scenes/Towers/" + curent_selection + ".tscn")
	stats_selected = load("res://Resources/Stats/Towers/" +cur_sel + "_stats.tres")
	price_tag.set_text(str(stats_selected.cost))
	var texts = stats_selected.info
	$"TR/MC/VBC/Purchace Button".show()
	$TR/MC/VBC/Header.set_text(texts[index]["header"])
	$TR/MC/VBC/Control/infoP.set_text(texts[index]["info"])
	
	
# Connect each tower button to the common function with its respective tower number
func _on_t_1_button_pressed():
	load_new_tower("tower", 1)
func _on_t_2_button_pressed():
	load_new_tower("tower", 2)
func _on_t_3_button_3_pressed():
	load_new_tower("tower", 3)
func _on_t_3_button_4_pressed():
	load_new_tower("tower", 4)
	
func _on_s_3_button_pressed():
	load_new_tower("spawner", 1)
func _on_s_button_4_pressed():
	load_new_tower("spawner", 2)
func _on_s_1_button_pressed():
	load_new_tower("spawner", 3)
func _on_s_2_button_4_pressed():
	load_new_tower("spawner", 4)
	
func _on_tr_1_button_pressed():
	load_new_tower("trap", 1)
func _on_tr_2_button_pressed():
	load_new_tower("trap", 2)
func _on_tr_3_button_3_pressed():
	load_new_tower("trap", 3)
func _on_tr_4_button_4_pressed():
	load_new_tower("trap", 4)
	
func _on_m_button_1_pressed():
	load_new_tower("$", 1)
func _on_m_button_2_pressed():
	load_new_tower("$", 2)
func _on_m_button_3_pressed():
	load_new_tower("$", 3)
func _on_m_button_4_pressed():
	load_new_tower("$", 4)
	
func _on_tower_b_pressed():
	catagory_chosen("towers", towersCon)
func _on_spawner_b_pressed():
	catagory_chosen("spawners", spawnersCon)
func _on_money_b_pressed():
	catagory_chosen("$", money_con)
func _on_trap_b_pressed():
	catagory_chosen("traps", trapsCon)
	
func catagory_chosen(catagory: String, headers_container: HBoxContainer):
	cur_selection = catagory
	$TR/catsCon.hide();
	headers_container.show();
	$TR/MC/VBC/Header.set_text(information[catagory]["header"])
	$TR/MC/VBC/Control/infoP.set_text(information[catagory]["info"])

func _on_back_button_pressed():
	if cur_selection == "towers":
		_on_tower_b_pressed()
		cur_selection = "none"
	elif cur_selection == "spawners":
		_on_spawner_b_pressed()
		cur_selection = "none"
	elif cur_selection == "$":
		_on_money_b_pressed()
		cur_selection= "none"
	elif cur_selection == "traps":
		_on_trap_b_pressed()
		cur_selection = "none"
	elif towersCon.visible or spawnersCon.visible or trapsCon.visible or money_con.visible :
		towersCon.hide()
		spawnersCon.hide()
		trapsCon.hide()
		money_con.hide()
		$TR/catsCon.show()
		$TR/MC/VBC/Header.set_text("Catagory choose")
		$TR/MC/VBC/Control/infoP.set_text("Select one of the catagorys above")
	else:
		print("load main menu")





















