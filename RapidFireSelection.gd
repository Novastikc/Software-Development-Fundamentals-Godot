extends CheckButton

func _ready():
	pass # Replace with function body.
	
func _on_RapidFireSelection_toggled(button_pressed):
	GlobalVariables.rapidFire = button_pressed
