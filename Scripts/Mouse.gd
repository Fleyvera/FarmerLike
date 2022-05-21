extends Node2D

const fx = preload("res://Prefabs/MouseFX.tscn")


func _ready():
	
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	
	pass


func _process(delta):
	
	backMouse()
	buildingNfarming()
	walkEffect()
	
	pass



func buildingNfarming():
	
	if get_owner().get_node("ShopBuildSystem") != null and get_owner().get_node("ShopBuildSystem")  != null:
		if get_owner().get_node("ShopBuildSystem").isBuilding or get_owner().get_node("ShopBuildSystem").isFarming:
			get_node("Sprite").hide()
		else:
			get_node("Sprite").show()
	
	pass


func walkEffect():
	var mpos = get_global_mouse_position()
	
	global_position = mpos
	
	if Input.is_action_just_pressed("Click") and Global.acting == false:
		
		var nfx = fx.instance()
		
		nfx.emitting = true
		
		nfx.global_position = global_position
		
		get_parent().add_child(nfx)
		pass



func _on_Area2D_area_entered(area):
	
	
	
	if area.is_in_group("Tree"):
		$Sprite.frame = 14
	elif area.is_in_group("Grass"):
		$Sprite.frame = 17
	
	pass 


func backMouse():
	
	
	var isOverlapping = get_node("Area2D").get_overlapping_areas()
	if isOverlapping.size() == 0:
		$Sprite.frame = 12
	
	pass
