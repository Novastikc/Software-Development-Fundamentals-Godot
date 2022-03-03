extends Control

export(int) var countdownMax
var currentTimer

func _ready():
	currentTimer = countdownMax
	$HUD/Countdown.text = str(currentTimer)
	
	while currentTimer > 0:
		yield(get_tree().create_timer(1.0), "timeout")
		$HUD/Countdown.text = str(currentTimer)
		$HUD/CurrentScore.text = str(GlobalVariables.scoringInformation["currentScore"])
		$HUD/HighScore.text = str(GlobalVariables.scoringInformation["highScore"])
		# High score from the dictonary in Global.gd needs to be updated somehow, but it's here.
		currentTimer = currentTimer - 1
		print(currentTimer)
	print("Game Over")
