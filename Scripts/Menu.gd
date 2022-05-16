extends Node2D


onready var mapSS = get_node("MapSizeSelector")


func _ready():
	
	MapSizeSelector()
	
	pass 



func _process(delta):
	
	MapSizeSelectorTest()
	
	pass


func MapSizeSelector():
	
	mapSS.add_item("Small")
	mapSS.add_item("Medium")
	mapSS.add_item("Big")
	
	pass

func MapSizeSelectorTest():
	
	if mapSS.selected == 0:
		Global.setMapSize = 16
	elif mapSS.selected == 1:
		Global.setMapSize = 24
	elif mapSS.selected == 2:
		Global.setMapSize = 32
	
	print(Global.setMapSize)
	print(mapSS.selected)
	
	pass



func _on_StartButton_pressed():
	
	get_tree().change_scene("res://Scenes/Game.tscn")
	
	pass



