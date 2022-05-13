extends KinematicBody2D

#Move
var speed = 0
onready var mpos = global_position
var dir = Vector2()



func _ready():
	
	startPos()
	
	pass 



func _physics_process(delta):
	
	move(delta)
	
	animation()
	
	action()
	
	pass


func move(delta):
	
	
	
	if Input.is_action_just_pressed("Click") and Global.acting == false:
		speed = Global.speed
		
		mpos = get_global_mouse_position()
		
		get_parent().get_node("MousePoint").global_position = mpos
		
		get_parent().get_node("MousePoint/CollisionShape2D").disabled = true
		get_parent().get_node("MousePoint/CollisionShape2D").disabled = false
	
	
	dir = (mpos - position).normalized()
	var move = dir * speed * delta
	move_and_collide(move)
	
	
	
	if mpos.x >= global_position.x:
		$AnimatedSprite.flip_h = true
	else:
		$AnimatedSprite.flip_h = false
	
	pass

func animation():
	
	var anim
	
	if speed == 0:
		anim = "Idle"
		$AnimationPlayer.play("Idle")
		$WalkFX.emitting = false
	else:
		anim = "Walk"
		$AnimationPlayer.play("Walk")
		$WalkFX.emitting = true
	
	$AnimatedSprite.play(anim)
	
	pass


#Sistema de interacao
func action():
	
	if Global.acting:
		speed = 0
	
	
	pass

#StartPosition
func startPos():
	
	
	yield(get_tree().create_timer(0.5), "timeout")
	var mainHouse = get_node("../../MainHouse")
	
	global_position = mainHouse.global_position + Vector2(10 , 32)
	
	pass

#Sistema de andar e parar
func _on_MousePoint_body_entered(body):
	
	if body.name == "Farmer":
		speed = 0
	
	pass 


func _on_MousePoint_body_exited(body):
	
	if body.name == "Farmer":
		speed = Global.speed
	
	pass 




