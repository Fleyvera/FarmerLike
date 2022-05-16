extends Node2D

var structurePool = preload("res://Prefabs/StructurePool.tscn")
var farmPool = preload("res://Prefabs/FarmPool.tscn")


var mpos

var build_num = 1
var farm_num = 0

var building
var farm

var isBuilding = false
var isFarming = false

func _ready():
	pass




func _process(delta):
	
	build()
	
	farm()
	
	posBuild()
	
	pass



func build():
	
	
	
	if Input.is_action_just_pressed("Hack") and isBuilding == false:
		Global.acting = true
		
		isBuilding = true
		
		#adicionando construcao ao mouse
		var nStructurePool = structurePool.instance()
		
		building = nStructurePool.spawnStructure(build_num)
		
		get_node("BuildRef").add_child(building)
		
		building.global_position = get_node("BuildRef").global_position
		
		building.get_node("StaticBody2D").queue_free()
		
		building.z_index = 5
	
	
	
	
		#adicionando construcao ao jogo
	if Input.is_action_just_pressed("Click") and isBuilding and building.get_node("BuildSystemTest").isBuildable:
		
		var nStructurePool = structurePool.instance()
		
		building = nStructurePool.spawnStructure(build_num)
		
		get_parent().add_child(building)
		
		building.global_position = get_node("BuildRef").global_position
		
		building.get_node("BuildSystemTest").notBuilded = false
		
		#deleta construcao do mouse
		get_node("BuildRef").get_child(0).queue_free()
		
		isBuilding = false
		
		Global.acting = false
		
		
	
		#deleta construcao do mouse
	if Input.is_action_just_pressed("RightClick") and isBuilding:
		
		get_node("BuildRef").get_child(0).queue_free()
		
		isBuilding = false
		
		Global.acting = false
	
	
	pass


func farm():
	
	
	
	if Input.is_key_pressed(KEY_P) and isFarming == false:
		Global.acting = true
		
		isFarming = true
		
		#adicionando construcao ao mouse
		var nFarmPool = farmPool.instance()
		
		farm = nFarmPool.spawnFarm(farm_num)
		
		get_node("BuildRef").add_child(farm)
		
		farm.global_position = get_node("BuildRef").global_position
		
#		farm.get_node("FirstStep").queue_free()
#		farm.get_node("SecondStep").queue_free()
#		farm.get_node("LastStep").queue_free()
#		farm.get_node("FinalStep").queue_free()
		
		farm.z_index = 5
	
	
	
	
		#adicionando construcao ao jogo
	if Input.is_action_just_pressed("Click") and isFarming and farm.get_node("FarmSystemTest").isBuildable:
		
		var nFarmPool = farmPool.instance()
		
		farm = nFarmPool.spawnFarm(farm_num)
		
		get_parent().add_child(farm)
		
		farm.global_position = get_node("BuildRef").global_position
		
		farm.isPlanted = true
		
		farm.get_node("FarmSystemTest").notBuilded = false
		
		#deleta construcao do mouse
		get_node("BuildRef").get_child(0).queue_free()
		
		isFarming = false
		
		Global.acting = false
		
		
		
		
	
		#deleta construcao do mouse
	if Input.is_action_just_pressed("RightClick") and isFarming:
		
		get_node("BuildRef").get_child(0).queue_free()
		
		isFarming = false
		
		Global.acting = false
	
	
	pass


	#Construcao segue o mouse antes de ser colocada em cena
func posBuild():
	var mpos = get_global_mouse_position()
	
	get_node("BuildRef").position = mpos
	
	

