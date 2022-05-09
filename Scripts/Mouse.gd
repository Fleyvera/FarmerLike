extends Node2D

const fx = preload("res://Scenes/MouseFX.tscn")


func _ready():
	
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	
	pass


func _process(delta):
	
	var mpos = get_global_mouse_position()
	
	global_position = mpos
	
	if Input.is_action_just_pressed("Click"):
		
		var nfx = fx.instance()
		
		nfx.emitting = true
		
		nfx.global_position = global_position
		
		get_parent().add_child(nfx)
	
	pass
