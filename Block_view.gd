extends Node2D

var is_Currently_Moving =false

func _ready():
	is_Currently_Moving=true
	Globals.connect("notactive",self,"disactive_Block_By_Block") # four different blocks are listening to the notactive signal
	


func can_rotate(val) -> bool:
	if(!Globals.canPreviewRotate): return false
	
	return true

func is_off_screen(vec) -> bool:
	if vec.x<0:
		return true
	elif vec.x>=get_parent().get_parent().get_rect().size.x:
		return true
	elif vec.y<0:
		return true
	elif vec.y>=get_parent().get_parent().get_rect().size.y:
		return true
	else:
		return false

func can_move_down(node):

	if Globals.notactive_Position_Vector.has(Vector2(get_parent().position.x+position.x,get_parent().position.y+position.y+80)) or get_parent().position.y+position.y==1520:
		return false
	else:
		return true
		

func can_move_left():
	if get_parent().position.x+position.x==0 or (Globals.notactive_Position_Vector.has(Vector2(get_parent().position.x+position.x-80,get_parent().position.y+position.y))) or not is_Currently_Moving:
		return false
	else:
		return true

func can_move_right():
	if get_parent().position.x+position.x==720 or (Globals.notactive_Position_Vector.has(Vector2(get_parent().position.x+position.x+80,get_parent().position.y+position.y))) or not is_Currently_Moving:
		return false
	else:
		return true

func shift_blocks(blocks):
	for i in blocks:
		Globals.notactive_Position_Vector[i].y+=80
		Globals.notactive_Block_Object[i].position.y+=80


	

