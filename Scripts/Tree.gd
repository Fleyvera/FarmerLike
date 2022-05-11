extends StaticBody2D

var clickOn = false
onready var farmer = get_node("../FarmerRoot/Farmer")
const actionBar = preload("res://Scenes/ActionBar.tscn")

func _ready():
	pass 



func _process(delta):
	
	drop(delta)
	
	pass


#Sistema de cair
func drop(delta):
	
	
	if Input.is_action_just_pressed("RightClick") and clickOn:
		
		#pega distancia para ver se e possivel interacao
		var distance = Vector2(global_position).distance_to(farmer.global_position)
		
		#testa se esta perto para interagir
		if distance >= 45:
			print("Você está muito longe")
		elif distance <= 45 and Global.acting == false:
			#Iniciar interacao
			Global.acting = true
#			$ActionArea.queue_free()
			
			#Chamar barrinha de progresso
			actionBar()
			
			
			
			#Teste para ver qual lado cair
			var dropAnim
			
			if global_position.x > farmer.global_position.x:
				dropAnim = "DroppingRight"
			else:
				dropAnim = "DroppingLeft"
			
			
			
			#Sistema de queda
			$TreeFx.emitting = true
			yield(get_tree().create_timer(Global.cuttingTime), "timeout")
			z_index = 0
			$TreeFx.emitting = false
			$AnimationPlayer.play(dropAnim)
			yield(get_tree().create_timer(1), "timeout")
			queue_free()
			
			#Finalizar interacao
			Global.acting = false
		print(distance)
	
	pass


#Sistema de chamar barrinha de acao
func actionBar():
	
	var nActionBar = actionBar.instance()
	
	nActionBar.time = Global.cuttingTime
	
	nActionBar.global_position = global_position
	
	get_parent().add_child(nActionBar)
	
	
	pass


#Sistema de interacao com o mouse
func _on_ActionArea_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	
	if area.is_in_group("Mouse"):
		
		clickOn = true
		
	
	
	pass 


func _on_ActionArea_area_shape_exited(area_rid, area, area_shape_index, local_shape_index):
	
	if area != null and area.is_in_group("Mouse"):
		
		clickOn = false
	
	
	
	pass # Replace with function body.
