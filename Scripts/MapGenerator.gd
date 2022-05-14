extends Node2D

onready var farmer = get_node("../FarmerRoot/Farmer")


var structurePool = preload("res://Prefabs/StructurePool.tscn")

var treePool = preload("res://Prefabs/Tree.tscn")

var grassPool = preload("res://Prefabs/GrassPool.tscn")

var mapPool = preload("res://Prefabs/MapPool.tscn")
var yMapSize = 0
var xMapSize = 0


func _ready():
	
	mainHouse()
	
	pass 


func _physics_process(delta):
	
	mapSpawner()
	
	pass


func treeSpawner():
	var nTreePool = treePool.instance()
	
	var tree = nTreePool.spawnRandomTree()
	
	randomize()
	
	tree.position = position + Vector2(rand_range(0 , 72) , rand_range(0 , 72))
	
	get_owner().call_deferred("add_child", tree)
	pass

func grassSpawner():
	var nGrassPool = grassPool.instance()
	
	var grass = nGrassPool.spawnRandomGrass()
	
	randomize()
	
	grass.position = position + Vector2(rand_range(0 , 72) , rand_range(0 , 72))
	
	get_owner().call_deferred("add_child", grass)
	pass

func mapSpawner():
	
	# X 72 e Y 72
	
	if xMapSize <= Global.setMapSize and yMapSize < Global.setMapSize - (Global.setMapSize / 3):
		xMapSize += 1
		
		var nMapPool = mapPool.instance()
		
		var map = nMapPool.spawnRandomMap()
		
		randomize()
		
		map.global_position = global_position
		
		get_owner().call_deferred("add_child", map)
		
		treeSpawner()
		grassSpawner()
		
		global_position += Vector2(72 , 0)
		
		if xMapSize >= Global.setMapSize:
			global_position.x = 0
			global_position += Vector2(0 , 72)
			xMapSize = 0
			yMapSize += 1
		
		
	pass

func mainHouse():
	
	#adicionando a casa principal
	var nStructurePool = structurePool.instance()
	
	var mainHouse = nStructurePool.spawnStructure(0)
	
	randomize()
	
	mainHouse.global_position = Vector2(rand_range(0 , (get_viewport().size.x - 150)) , rand_range(0 , (get_viewport().size.y - 150) ))
	
	get_owner().call_deferred("add_child", mainHouse)
	
	
	pass
