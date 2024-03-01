extends State

class_name HitState

@export var damageable : Damageable
@export var character_state_machine : CharacterStateMachine
@export var dead_state : State
@export var collision : CollisionShape2D
@export var dead_animation_node : String = "Death"
@export var knockback_velocity : Vector2 = Vector2(100, 100)
@export var return_state : State
@onready var score = get_node("/root/Node/Score")
@onready var timer : Timer = $Timer

func _ready():
	damageable.connect("on_hit", on_damageable_hit)
	
	
func on_enter():
	timer.start()
	
func on_exit():
	character.velocity = Vector2.ZERO
	
func on_damageable_hit(node : Node, damage_amount: int, knockback_direction : Vector2):
	if (damageable.health > 0):
		character.velocity = knockback_velocity * knockback_direction
		emit_signal("interrupt_state", self)
	else:
		emit_signal("interrupt_state", dead_state)
		playback.travel(dead_animation_node)
		collision.disabled = true
		score.add_point()


func _on_timer_timeout():
	next_state = return_state
