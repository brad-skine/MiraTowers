extends Resource

class_name trapStats

@export var tower_cost: float = 50
@export var damage  : int


var info = { # will change this to be in shop and read from stats
	0: {"header": "Spawners", "info": "Select what spawner you would like to purchase"},
	1: {"header": "Trap 1", "info": "trap 1 does this and that and that\nstats: 123\nstats: yep"},
	2: {"header": "Trap 2", "info": "tower 2 does this and that and that\nstats: 123\nstats: yep"},
	3: {"header": "Trap 3", "info": "tower 3 does this and that and that\nstats: 123\nstats: yep"},
	4: {"header": "Trap 4", "info": "tower 4 does this and that and that\nstats: 123\nstats: yep"}
}		
