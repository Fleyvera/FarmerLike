extends TileMap





func _ready():
	pass 



#
#func _process(delta):
#	pass


func _on_Area2D_area_entered(area):
	
	if area.is_in_group("Tree") or area.is_in_group("Grass"):
		area.get_parent().queue_free()
		
	pass # Replace with function body.
