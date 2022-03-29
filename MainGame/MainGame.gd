extends Control

export(int) var countdownMax
var currentTimer

func _ready():
	currentTimer = countdownMax
	$HUD/Countdown.text = str(currentTimer)
	
	set_process(true)
	while currentTimer > 0:
		yield(get_tree().create_timer(1.0), "timeout")
		$HUD/Countdown.text = str(currentTimer)
		# High score from the dictonary in Global.gd needs to be updated somehow, but it's here.
		currentTimer = currentTimer - 1
		print(currentTimer)
	print("Game Over")
	
	if GlobalVariables.previousScores.size() < 5:
		GlobalVariables.previousScores.push_front(GlobalVariables.scoringInformation["currentScore"])
	else: 
		GlobalVariables.previousScores.remove(4)
		# This removes the fourth element of the high scores (0,1,2,3,4) <-
		# a bug with this is that you need a new run per run to reset for newest score
	print(GlobalVariables.previousScores)
	get_tree().change_scene("res://EndScene.tscn")

func _process(delta):
	$HUD/CurrentScore.text = str(GlobalVariables.scoringInformation["currentScore"])
