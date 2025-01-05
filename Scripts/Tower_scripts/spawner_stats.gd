extends Resource

class_name spawnerStats


@export var cost: float = 50
@export var health  : int
@export var spawned_unit : PackedScene


var info = { # will change this to be in shop and read from stats
	0: {"header": "Spawners", "info": "Select what spawner you would like to purchase"},
	1: {"header": "Spawner 1", "info": "tower 1 does this and that and that\nstats: 123\nstats: yep"},
	2: {"header": "Spawner 2", "info": "tower 2 does this and that and that\nstats: 123\nstats: yep"},
	3: {"header": "Spawner 3", "info": "tower 3 does this and that and that\nstats: 123\nstats: yep"},
	4: {"header": "Spawner 4", "info": "tower 4 does this and that and that\nstats: 123\nstats: yep"}
}		
