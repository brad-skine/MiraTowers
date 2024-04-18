extends Node

var seconds = 0
var minutes = 0
const secs_in_minute = 60
const max_minutes = 99
@onready var timer := $Timer
@onready var label := $Label
var clock_ticking : bool  = false

func pause_play_clock():
	clock_ticking = not clock_ticking
	
func show_clock():
	$Label.show()
	
func hide_clock():
	$Label.hide()

func _on_timer_timeout():
	if(clock_ticking):
		if seconds < secs_in_minute:
			seconds += 1
		else:
			if minutes < max_minutes:
				minutes += 1
			else:
				minutes = 0
			seconds = 0
		update_clock()
	
func update_clock():
	var SectwoDp = "0"
	var MinTwoDp = "0"

	if (minutes >= 10):
		MinTwoDp = "" 
	if (seconds >= 10):
		SectwoDp = ""
	$Label.text =  str(MinTwoDp) +str(minutes) + ":" + str(SectwoDp) + str(seconds)
	


