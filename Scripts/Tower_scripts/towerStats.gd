extends Resource

class_name towerStats


@export var tower_cost: float = 50
@export var health  : int
@export var fire_rate : float
@export var bullet_speed : int
@export var sprite : Texture2D

@export var info = { # will move into a seperate recaouse as this makes absolutoy no sense repeated alot
	0: {"header": "Towers", "info": "select what tower you would like to purchase" },
	1: {"header": "Tower 1", "info": "tower 1 does this and that and that\nstats: 123\nstats: yep"},
	2: {"header": "Tower 2", "info": "tower 2 does this and that and that\nstats: 123\nstats: yep"},
	3: {"header": "Tower 3", "info": "?????????? 3 that\nstats: 123\nstats: yep"},
	4: {"header": "Tower 4", "info": "tower 4 does this and that and that\nstats: 123\nstats: yep"}
}
