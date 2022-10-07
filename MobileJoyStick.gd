extends CanvasLayer

signal use_move_vector
var move_vector = Vector2(0,0)
var joystick_active = false

func _input(event):
	
	if event is InputEventScreenTouch or event is InputEventScreenDrag:
		
		emit_signal("use_move_vector",event)
		if $TouchScreenButton.is_pressed():
			move_vector = calc_move_vector(event.position)
			joystick_active = true
			$InnerCircle.position = event.position
			$InnerCircle.visible = true
			
			
	if event is InputEventScreenTouch:
		if event.pressed == false:
			joystick_active = false
			$InnerCircle.visible = false
			
			
func _physics_process(delta):
	if joystick_active:
		pass
		 
func calc_move_vector(event_position):
	var texture_center = $TouchScreenButton.position+ Vector2(170.5,170.5)
	return (event_position - texture_center).normalized() # use normalized to get the angle
