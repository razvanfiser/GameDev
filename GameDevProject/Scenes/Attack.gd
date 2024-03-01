extends State

@export var return_state : State
@export var attack1_name : String = "Attack1"
@export var attack2_name : String = "Attack2"
@export var air_state : State
@export var ground_state : State


var attacks : Array[String] = [attack1_name, attack2_name]
var attack_index : int = 0
@onready var timer : Timer = $Timer

func on_enter():
	playback.travel(attacks[attack_index])
	attack_index = (attack_index + 1) % 2

func _on_animation_tree_animation_finished(anim_name):
	if (anim_name == attack1_name || anim_name == attack2_name):
		#print(anim_name + " is finished.")
		next_state = get_return_state()
			
func get_return_state():
	if (character.is_on_floor()):
		return ground_state
	return air_state
