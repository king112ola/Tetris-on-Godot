extends Node

signal notactive
const StartMenu = preload("res://StartMenu.tscn")
const MainScene = preload("res://Main.tscn")

var notactive_Position_Vector = []
var notactive_Block_Object = []

var view_notactive_Position_Vector = []
var view_notactive_Block_Object = []
var speed = 1
var current_mov_shape
var canPreviewRotate = false

func call_For_Remaining_Blocks():
	emit_signal("notactive") # trigger the singal of the 4 different blocks
	
func restart_game():
	speed=1
	notactive_Position_Vector.clear()
	notactive_Block_Object.clear()
	view_notactive_Position_Vector.clear()
	view_notactive_Block_Object.clear()
	current_mov_shape = null
	canPreviewRotate = false
	
#	for n in get_tree().get_root().get_children():
#
#		if  "Main" ==n.name :
#			get_tree().get_root().remove_child(n)
#
#
	
	get_tree().reload_current_scene()

