extends State

class_name AirState

@export var ground_state : State
@export var landing_state : State
@export var attack_state : State
@export var double_jump_velocity : float = -400
@export var jump_animation : String = "Jump"
var can_double_jump : bool = true


func state_input(event: InputEvent):
	if (event.is_action_pressed("jump") and can_double_jump):
		double_jump()
		playback.travel(jump_animation)
	if (event.is_action_pressed("attack")):
		attack()

func state_process(delta):
	if (character.is_on_floor()):
		next_state = ground_state
		can_double_jump = true
		
func double_jump():
	character.velocity.y = double_jump_velocity
	can_double_jump = false

func attack():
	next_state = attack_state

