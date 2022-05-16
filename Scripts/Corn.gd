extends Node2D

var growStage = 0

var isPlanted = false

func _ready():
	pass 



func _process(delta):
	
	growing()
	
	print(isPlanted)
	
	if isPlanted == true:
		$GrowTimer.start()
		isPlanted = false
	
	pass



func _on_GrowTimer_timeout():
	
	growStage += 1
	
	pass 



func growing():
	
	if growStage == 1:
		$Seed.hide()
		$FirstStep.show()
		$SecondStep.hide()
		$LastStep.hide()
		$FinalStep.hide()
	elif growStage == 2:
		$Seed.hide()
		$FirstStep.hide()
		$SecondStep.show()
		$LastStep.hide()
		$FinalStep.hide()
	elif growStage == 3:
		$Seed.hide()
		$FirstStep.hide()
		$SecondStep.hide()
		$LastStep.show()
		$FinalStep.hide()
	elif growStage == 4:
		$Seed.hide()
		$FirstStep.hide()
		$SecondStep.hide()
		$LastStep.hide()
		$FinalStep.show()
	elif growStage >= 5:
		$GrowTimer.stop()
	
	pass
