extends Node2D


var raining = false

var rainTime

func _ready():
	pass 



func _process(delta):
	
	if raining:
		$RainFx.emitting = true
	else:
		$RainFx.emitting = false
	
	
	pass




func _on_RainTime_timeout():
	
	
	raining = false
	$TimerToRain.start()
	pass 


func _on_TimerToRain_timeout():
	
	randomize()
	var timeToRain = randi()%100+1
	if timeToRain >= 85:
		raining = true
		timeToRain = 0
		randomize()
		rainTime = randi()%60+30
		$RainTime.wait_time = rainTime
		$RainTime.start()
		$TimerToRain.stop()
	
	
	
	print(rainTime)
	print(timeToRain)
	
	pass # Replace with function body.
