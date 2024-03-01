extends Node

var enemy_node = preload("res://Scenes/skelleton.tscn")
@export var player : Player

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	var a = randi_range(0, 1)
	var player_pos : Vector2 = player.position
	var instance = enemy_node.instantiate()
	instance.position = player_pos + (1-a)*Vector2(150, 0) + a * Vector2(-150, 0)
	add_child(instance)
