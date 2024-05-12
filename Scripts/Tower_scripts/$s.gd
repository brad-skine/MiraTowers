extends tower_super_class

@onready var spri = $Sprite2D
@onready var collision_shape_2d = $HitboxComponent/CollisionShape2D
@onready var money_label = $Sprite2D/money_label

@onready var animation_player = $AnimationPlayer
@onready var audio_stream_player = $AudioStreamPlayer

# TODO: Make so can acually get money

func _ready():
	money_label.set_text(str(stats.money_per_click))
	


func _input(event):
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT:
		var size = spri. texture.get_size() * spri.scale #uyse .x and .y 
		size = spri.texture.get_size() * spri.scale  # Using .x and .y
		#TODO should probably use tile size, will make it globala in Global
		
		var sprite_half_width = size.x / 2  # Half of the sprite's width
		var sprite_half_height = size.y / 2  # Half of the sprite's height
		# Calculate the bounds of the sprite
		var left_bound = position.x - sprite_half_width
		var right_bound = position.x + sprite_half_width
		var top_bound = position.y - sprite_half_height
		var bottom_bound = position.y + sprite_half_height

		# Check if the event position is within the bounds of the sprite
		if (event.position.x >= left_bound and event.position.x <= right_bound and event.position.y >= top_bound and event.position.y <= bottom_bound):
			on_click_add_money(stats.money_per_click)
		
		
func on_click_add_money(value: int):
	# will need to add check for what playre but will be hard later
	animation_player.play("click_add_money1")
	Player1.increase_money(value)

		
		
			
