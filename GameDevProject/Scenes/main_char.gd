extends CharacterBody2D

class_name Player

@export var speed = 500.0
@export var max_health : int = 100
var health : int = max_health

const GRAVITY_MULTIPLIER = 2
var allow_double_jump = false
var flip : int = 0
@onready var label_health = %LabelHealth
@onready var sprite2d = get_node("Sprite2D")
@onready var animation_tree : AnimationTree = get_node("AnimationTree")
@onready var state_machine : CharacterStateMachine = $CharacterStateMachine

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

signal facing_direction_changed(facing_right : bool)

func _ready():
	animation_tree.active = true

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)

	move_and_slide()
	update_animation()
	#update_facing_direction()

func update_animation():
	var direction = Input.get_axis("left", "right")
	if (direction != 0):
		flip = direction
	animation_tree.set("parameters/Move/blend_position", direction)
	sprite2d.flip_h = (flip < 0)
	
	emit_signal("facing_direction_changed", !sprite2d.flip_h)
	
func do_damage(damage : int):
	health -= damage
	print("Current health: " + str(health))
	label_health.text = "Health: " + str(health)
	if health <= 0:
		get_tree().reload_current_scene()
#func update_facing_direction():
	

	
