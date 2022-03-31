extends Button

func _ready():
	pass # Replace with function body.
	
func _on_StartGameButton_pressed():
	GlobalVariables.scoringInformation["currentScore"] = 0
	get_tree().change_scene("res://MainGame/MainGame.tscn")


func _on_QuitGame_pressed():
	get_tree().quit()
