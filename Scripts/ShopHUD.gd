extends Node2D


var isOpen = false


func _ready():
	pass 





func _process(delta):
	
	OpenClose()
	
	pass


func OpenClose():
	
	
	
	if Input.is_action_just_pressed("Shop") and isOpen == false:
		$AnimationPlayer.play("Open")
		yield(get_tree().create_timer(1), "timeout")
		isOpen = true
	elif Input.is_action_just_pressed("Shop") and isOpen == true:
		$AnimationPlayer.play("Close")
		yield(get_tree().create_timer(1), "timeout")
		isOpen = false
	


func _on_Corn_pressed():
	
	get_owner().get_owner().get_node("ShopBuildSystem").farm_num = 0
	Input.action_press("Farm")
	
	pass 


func _on_FarmSpot_pressed():
	
	get_owner().get_owner().get_node("ShopBuildSystem").farm_num = 1
	Input.action_press("Build")
	
	pass # Replace with function body.
