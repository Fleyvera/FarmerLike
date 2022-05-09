extends StaticBody2D

var clickOn = false
onready var farmer = get_node("../FarmerRoot/Farmer")

func _ready():
	pass 



func _process(delta):
	
	if Input.is_action_just_pressed("RightClick") and clickOn:
		
		#pega distancia para ver se e possivel interacao
		var distance = Vector2(global_position).distance_to(farmer.global_position)
		
		if distance >= 45:
			print("Você está muito longe")
		else:
			$AnimationPlayer.play("Dropping")
			yield(get_tree().create_timer(1), "timeout")
			queue_free()
		
		print(distance)
		
	
	pass


#funcao de cair
func drop(delta):
	
	var timer
	
	pass




func _on_ActionArea_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	
	if area.is_in_group("Mouse"):
		
		clickOn = true
		
	
	
	pass 


func _on_ActionArea_area_shape_exited(area_rid, area, area_shape_index, local_shape_index):
	
	if area.is_in_group("Mouse"):
		
		clickOn = false
	
	
	
	pass # Replace with function body.
