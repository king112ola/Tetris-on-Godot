extends TouchScreenButton

class_name SwipeScreenButton

var on_area := false


func _ready():
	self.connect("pressed", self, "_on_self_pressed")
	self.connect("released", self, "_on_self_released")


func get_swipe_direction(swipe, swipe_margin):
	
	var swipe_direction := Vector2.ZERO
	
	
	if swipe.x >= -swipe_margin and swipe.x <= swipe_margin and swipe.y >= swipe_margin:
		swipe_direction = Vector2.DOWN

	if swipe.x >= -swipe_margin and swipe.x <= swipe_margin and swipe.y <= -swipe_margin:
		swipe_direction = Vector2.UP
	
	if swipe.y >= -swipe_margin and swipe.y <= swipe_margin and swipe.x >= swipe_margin:
		swipe_direction = Vector2.RIGHT
	
	if swipe.y >= -swipe_margin and swipe.y <= swipe_margin and swipe.x <= -swipe_margin:
		swipe_direction = Vector2.LEFT
	
	if on_area == true:
		
		return swipe_direction
	

	# Example of getting down left angle swipe
#	elif swipe.x >= -swipe_margin and swipe.y >= swipe_margin:
#		swipe_direction = Vector2(-1,1)


func _on_self_pressed():

	on_area = true



func _on_self_released():

	on_area = false







