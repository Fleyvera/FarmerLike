extends KinematicBody2D

#Move
var speed = 0
onready var mpos = global_position
var dir = Vector2()


func _ready():
	pass 



func _process(delta):
	
	move(delta)
	
	animation()
	pass


func move(delta):
	
	
	
	if Input.is_action_just_pressed("Click"):
		speed = 100
		
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
	else:
		anim = "Walk"
	
	$AnimatedSprite.play(anim)
	
	pass


func _on_MousePoint_body_entered(body):
	
	if body.name == "Farmer":
		speed = 0
	
	pass 


func _on_MousePoint_body_exited(body):
	
	if body.name == "Farmer":
		speed = 100
	
	pass 
