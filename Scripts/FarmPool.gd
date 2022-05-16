extends Node2D







func spawnFarm(valor):
	return get_children()[valor].duplicate()

func spawnRandomFarm():
	return get_children()[rand_range(0 , get_children().size()) ].duplicate()







func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
