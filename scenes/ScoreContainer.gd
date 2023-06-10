extends HBoxContainer

@onready var left_score: Label = $LeftScore
@onready var right_score: Label = $RightScore

func change_score(left, right):
	left_score.text = str(left)
	right_score.text = str(right)
