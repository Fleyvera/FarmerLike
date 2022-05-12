extends Camera2D


func _physics_process(delta):
	
	zoomInOut()
	
	
	pass



func zoomInOut():
	
	
	if Input.is_action_just_released("ScrollDown") and zoom <= Vector2(2 , 2):
		zoom += Vector2(0.1 , 0.1)
	if Input.is_action_just_released("ScrollUp") and zoom >= Vector2(0.7 , 0.7):
		zoom -= Vector2(0.1 , 0.1)
	
	pass
