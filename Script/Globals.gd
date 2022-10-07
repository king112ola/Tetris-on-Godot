extends Node

signal notactive

var notactive_Position_Vector = []
var notactive_Block_Object = []

var view_notactive_Position_Vector = []
var view_notactive_Block_Object = []
var speed = 1

func call_For_Remaining_Blocks():
	emit_signal("notactive") # trigger the singal of the 4 different blocks
	
func restart_game():
	speed=1
	notactive_Position_Vector.clear()
	notactive_Block_Object.clear()
	view_notactive_Position_Vector.clear()
	view_notactive_Block_Object.clear()
	get_tree().reload_current_scene()
