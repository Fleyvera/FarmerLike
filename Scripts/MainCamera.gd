extends Camera2D

var xLimit
var yLimit


func _ready():
	
	var xLimit = Global.setMapSize * 72
	var yLimit = (Global.setMapSize / 2) * 72
	
	limit_right = xLimit
	limit_bottom = yLimit
	
	pass




func _physics_process(delta):
	
	zoomInOut()
	
	
	pass



func zoomInOut():
	
	
	if Input.is_action_just_released("ScrollDown") and zoom <= Vector2(1.1 , 1.1):
		zoom += Vector2(0.1 , 0.1)
	if Input.is_action_just_released("ScrollUp") and zoom >= Vector2(0.7 , 0.7):
		zoom -= Vector2(0.1 , 0.1)
	
	pass
