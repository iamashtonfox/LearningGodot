extends Node


var score = 0
@onready var coins: Label = $"../Player/Camera2D/CoinsLabel"

func add_point():
	score += 1
	coins.text = str(score)
	print(score)
