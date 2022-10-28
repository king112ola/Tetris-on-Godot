extends Shape0

func _ready():

	match (Globals.current_mov_shape):
		1:
			rotation_matrix=[
			[Vector2(-80,0),Vector2(0,0),Vector2(80,0),Vector2(160,0)],
			[Vector2(0,80),Vector2(0,0),Vector2(0,-80),Vector2(0,-160)],
			[Vector2(80,0),Vector2(0,0),Vector2(-80,0),Vector2(-160,0)],
			[Vector2(0,-80),Vector2(0,0),Vector2(0,80),Vector2(0,160)]
			]
		2:
			rotation_matrix=[
			[Vector2(-80,0),Vector2(0,0),Vector2(80,0),Vector2(80,-80)],
			[Vector2(0,-80),Vector2(0,0),Vector2(0,80),Vector2(80,80)],
			[Vector2(80,0),Vector2(0,0),Vector2(-80,0),Vector2(-80,80)],
			[Vector2(0,80),Vector2(0,0),Vector2(0,-80),Vector2(-80,-80)]
			]
		3:
			rotation_matrix=[
			[Vector2(-80,0),Vector2(0,0),Vector2(80,0),Vector2(0,-80)],
			[Vector2(0,-80),Vector2(0,0),Vector2(0,80),Vector2(80,0)],
			[Vector2(80,0),Vector2(0,0),Vector2(-80,0),Vector2(0,80)],
			[Vector2(0,-80),Vector2(0,0),Vector2(0,80),Vector2(-80,0)]
			]
			
		4:
			rotation_matrix=[
			[Vector2(80,0),Vector2(0,0),Vector2(-80,0),Vector2(-80,-80)],
			[Vector2(0,80),Vector2(0,0),Vector2(0,-80),Vector2(80,-80)],
			[Vector2(-80,0),Vector2(0,0),Vector2(80,0),Vector2(80,80)],
			[Vector2(0,-80),Vector2(0,0),Vector2(0,80),Vector2(-80,80)]
			]
			
		5:
			rotation_matrix=[
			[Vector2(-80,0),Vector2(0,0),Vector2(-80,80),Vector2(0,80)],
			[Vector2(-80,0),Vector2(0,0),Vector2(-80,80),Vector2(0,80)],
			[Vector2(-80,0),Vector2(0,0),Vector2(-80,80),Vector2(0,80)],
			[Vector2(-80,0),Vector2(0,0),Vector2(-80,80),Vector2(0,80)]
			]
			
		6:
			rotation_matrix=[
			[Vector2(80,0),Vector2(0,0),Vector2(0,-80),Vector2(-80,-80)],
			[Vector2(0,80),Vector2(0,0),Vector2(80,0),Vector2(80,-80)],
			[Vector2(80,0),Vector2(0,0),Vector2(0,-80),Vector2(-80,-80)],
			[Vector2(0,80),Vector2(0,0),Vector2(80,0),Vector2(80,-80)]
			]
			
		7:
			rotation_matrix=[
			[Vector2(-80,0),Vector2(0,0),Vector2(0,-80),Vector2(80,-80)],
			[Vector2(0,-80),Vector2(0,0),Vector2(80,0),Vector2(80,80)],
			[Vector2(80,0),Vector2(0,0),Vector2(0,80),Vector2(-80,80)],
			[Vector2(0,80),Vector2(0,0),Vector2(-80,0),Vector2(-80,-80)]
			]
		
	draw_shape()
	rotate_position=1
