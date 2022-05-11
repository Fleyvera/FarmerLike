extends Node2D


var treePool = preload("res://Prefabs/Tree.tscn")


func _ready():
	
	pass 


func _process(delta):
	pass


func treeSpawner():
	var nTreePool = treePool.instance()
	
	var tree = nTreePool.spawnRandomTree()
	
	randomize()
	
	tree.global_position = Vector2(rand_range(0 , get_viewport().size.x) , rand_range(0 , get_viewport().size.y) )
	
	get_owner().call_deferred("add_child", tree)
	pass


func _on_Timer_timeout():
	
	treeSpawner()
	
	pass # Replace with function body.
