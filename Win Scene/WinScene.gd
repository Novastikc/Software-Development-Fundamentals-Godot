extends Node2D

func _ready():
	if GlobalVariables.scoringInformation["currentScore"] > GlobalVariables.scoringInformation["highScoreFirst"]:
		print("winner")
	# Below sorts the array
	GlobalVariables.scoringInformation["highScores"].sort()
	
	# Searches the array value, or the position in the array where it will "fit".
	var highScorePosition = GlobalVariables.scoringInformation["highScores"].bsearch(GlobalVariables.scoringInformation["currentScore"], true)
	print("position #", highScorePosition)
	
	# Inserts the value into the array at the correct position.
	GlobalVariables.scoringInformation["highScores"].insert(highScorePosition, GlobalVariables.scoringInformation["currentScore"])
	
	# Removes the first (and lowest) score.
	GlobalVariables.scoringInformation["highScores"].remove(0)
	
	#Debugging.
	print(GlobalVariables.scoringInformation["highScores"])
