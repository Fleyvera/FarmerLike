extends Node2D

var structurePool = preload("res://Prefabs/StructurePool.tscn")

var mpos

var build_num = 1

var building
var nBuilding

func _ready():
	pass




func _process(delta):
	
	build()
	
	posBuild()
	
	pass



func build():
	
	if Input.is_action_just_pressed("Hack"):
		Global.acting = true
		
		#adicionando plantacao
		var nStructurePool = structurePool.instance()
		
		building = nStructurePool.spawnStructure(build_num)
		
		get_parent().get_node("BuildRef").add_child(building)
		
		building.global_position = get_parent().get_node("BuildRef").global_position
	
	pass


func posBuild():
	var mpos = get_global_mouse_position()
	
	get_parent().get_node("BuildRef").position = mpos
	
	

