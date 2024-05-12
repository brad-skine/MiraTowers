extends Resource

class_name money_stats

@export var health  : int = 1
@export var money_per_click : int

var info = { # will change this to be in shop and read from stats
	0: {"header": "Spawners", "info": "Select what spawner you would like to purchase"},
	1: {"header": "money 1", "info": "tower 1 does this and that and that\nstats: 123\nstats: yep"},
	2: {"header": "money 2", "info": "tower 2 does this and that and that\nstats: 123\nstats: yep"},
	3: {"header": "money 3", "info": "tower 3 does this and that and that\nstats: 123\nstats: yep"},
	4: {"header": "money 4", "info": "tower 4 does this and that and that\nstats: 123\nstats: yep"}
}		
