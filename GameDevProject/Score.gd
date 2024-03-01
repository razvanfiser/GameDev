extends Node

class_name Score

@onready var label = %Label
var score : int = 0

func add_point():
	score += 1
	label.text = "Score: " + str(score)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
