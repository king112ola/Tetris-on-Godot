extends Node2D

var is_Currently_Moving =false
var EFFECT = preload("res://Explosion.tscn")

var shape1_view=preload("res://Shape1_view.tscn")

func _ready():
	is_Currently_Moving=true
	Globals.connect("notactive",self,"disactive_Block_By_Block") # four different blocks are listening to the notactive signal

func disactive_Block_By_Block(): ## check if the blocks are inactivated
	
	if is_Currently_Moving: 
		
		get_parent().is_fixed=true
		is_Currently_Moving=false # make the current block running this function to be not active
		
		get_tree().root.get_node("Main").active_block=false
		
		Globals.notactive_Position_Vector.append(get_parent().position+position)
		Globals.notactive_Block_Object.append(self)
		
		Globals.call_For_Remaining_Blocks()
		check_full_line()



		

func can_rotate(val) -> bool:

	

	if is_off_screen(Vector2(get_parent().position.x+val.x,get_parent().position.y)):
		Globals.canPreviewRotate = false
		return false
	else:
		Globals.canPreviewRotate = true
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
		disactive_Block_By_Block()
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

func check_full_line():
	
	var index=0
	var count=0
	var positions_to_erase=[]
	var blocks_to_shift=[]
	var globXY = []
	
	for i in Globals.notactive_Position_Vector:
		
		if i.y==get_parent().position.y+position.y:
					
		
			globXY.push_back(i)
		
			positions_to_erase.append(index)
			count+=1
		index+=1
		
		

	if count==10: # if 10 blocks in a row
		######################################################################
		var main = get_tree().root.get_node("Main")
		
		var pos = 160
		globXY[0].x= 0
		for  i in globXY:
			
			if(i.x!=0):
				i.x=pos
				pos+=160
		
			i.y*= 1.65
			
			var effect = EFFECT.instance()
			
			main.add_child(effect)
		

				
			effect.global_position = Vector2(i)
			

		######################################################################
		
		Input.vibrate_handheld(50)
		destroy_line(positions_to_erase) # destroy the row blocks
		index=0
		
		
		
		for i in Globals.notactive_Position_Vector: # i representing the existing blocks in the array
			
			if i.y<get_parent().position.y+position.y:
				
				blocks_to_shift.append(index)
			index+=1
		
		shift_blocks(blocks_to_shift)

func destroy_line(indexes):
	var line_vals=indexes
	for i in range(line_vals.size()-1,-1,-1):
		
		Globals.notactive_Position_Vector.remove(line_vals[i])
		Globals.notactive_Block_Object[line_vals[i]].destroy_block()
		Globals.notactive_Block_Object.remove(line_vals[i])


func shift_blocks(blocks):
	for i in blocks:
		Globals.notactive_Position_Vector[i].y+=80
		Globals.notactive_Block_Object[i].position.y+=80

func destroy_block():
	queue_free()
	
	
	
	
	

