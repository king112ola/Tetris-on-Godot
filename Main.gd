extends Node2D

onready var shape1=preload("res://Shape1.tscn")
onready var shape2=preload("res://Shape2.tscn")
onready var shape3=preload("res://Shape3.tscn")
onready var shape4=preload("res://Shape4.tscn")
onready var shape5=preload("res://Shape5.tscn")
onready var shape6=preload("res://Shape6.tscn")
onready var shape7=preload("res://Shape7.tscn")



# check the screen control
onready var Swipe = $SwipeScreenButton
var shapes=[]
var currentMovingShape
var active_block=false
var rnd=RandomNumberGenerator.new()
var num:int=-1
var next_num:int=0
var interval = 4
var timeForRight =interval
var timeForLeft =interval
var numberOfRandom = 7
var testShapes = [shape1,shape5]
#var forseeShape
#var factorFor_forseeShape = 1441

func _ready():
	shapes=[shape1,shape2,shape3,shape4,shape5,shape6,shape7]
	rnd.randomize()

func _on_Timer_timeout():
	$Timer.wait_time=Globals.speed
	
	if not active_block: ## Generate new blocks if there is no more active block
		num=rnd.randi()%numberOfRandom if num==-1 else next_num
		next_num=rnd.randi()%numberOfRandom
	
		currentMovingShape=shapes[num].instance()
		#forseeShape = x.instance()
		$ShapesArea.add_child(currentMovingShape)
	#	$ShapesArea2.add_child(forseeShape)
		
	#	factorFor_forseeShape = 1441
		
		currentMovingShape.position=Vector2(320,80)
	#	forseeShape.position=Vector2(currentMovingShape.position.x,currentMovingShape.position.y+factorFor_forseeShape)
		

		active_block=true
	else:
		move_down()


func move_left():
	if active_block:
		
		currentMovingShape.move_left()

func move_right():
	if active_block:
		currentMovingShape.move_right()

func move_down():
	
	if active_block:
	#	forseeShape.position=Vector2(currentMovingShape.position.x,currentMovingShape.position.y+factorFor_forseeShape)

		currentMovingShape.move_down()
	#	factorFor_forseeShape -=80	
		$Timer.start()
		


var releaseFromDrag = false
var start_pos
func _input(event):
	
		
		
		if Input.is_action_just_pressed("ui_right"):
			move_right()
		if Input.is_action_just_pressed("ui_left"):
			move_left()
		if Input.is_action_just_pressed("ui_down"):
			for i in 50:
				move_down()    
			
		if Input.is_action_just_pressed("ui_up"):
			currentMovingShape.rotate_it()


func _on_CanvasLayer_use_move_vector(event):
	if currentMovingShape:
		
		if event is InputEventScreenDrag:
			if Swipe.get_swipe_direction(event.relative,3.5) == Vector2.RIGHT:
				if(timeForRight==0):
					timeForRight=interval;
				if(timeForRight==interval):	
					move_right()
					
				timeForRight-=1;
				releaseFromDrag = true
			elif Swipe.get_swipe_direction(event.relative,3.5) == Vector2.LEFT:
				if(timeForLeft==0):
					timeForLeft=interval;
				if(timeForLeft==interval):
					move_left()
				timeForLeft-=1;
				releaseFromDrag = true
				
			elif Swipe.get_swipe_direction(event.relative,9) == Vector2.DOWN:
				for i in 50:
					move_down()    
				releaseFromDrag = true

				
		
		if event is InputEventScreenTouch:
			print("touch")
			
			if not event.is_pressed() and releaseFromDrag == false:
				currentMovingShape.rotate_it()    
			releaseFromDrag = false
