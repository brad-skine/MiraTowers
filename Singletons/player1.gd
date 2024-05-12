extends Node

@onready var money : int = Global.startingMoney
var mult : int = 1
var money_label : Label

func increase_money(amount: int) -> void:
	money += amount * mult
	update_money_text()
func decrease_money(amount: int) -> void:
	money -= amount
	update_money_text()
func update_money_text() -> void:
	money_label.set_text(str(money))
