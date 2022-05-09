extends Node2D

const fx = preload("res://Prefabs/MouseFX.tscn")


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


func _on_Area2D_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	
	if area.is_in_group("Tree"):
		$Sprite.frame = 14
	
	pass 


func _on_Area2D_area_shape_exited(area_rid, area, area_shape_index, local_shape_index):
	
	if area.is_in_group("Tree"):
		$Sprite.frame = 12
	
	pass # Replace with function body.
