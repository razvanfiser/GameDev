extends CharacterBody2D

@onready var animation_tree : AnimationTree = $AnimationTree

#@export var player : Player
var player : Player
@export var direction : Vector2 = Vector2.LEFT
@export var hit_state : State
@export var speed = 150.0

@onready var sprite2d = $Sprite2D
@onready var state_machine : CharacterStateMachine = $CharacterStateMachine
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	player = get_node("/root/Node/Player")
	print(player)
	animation_tree.active = true
	
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	direction = (player.global_position - self.global_position).normalized()
	if direction.x < 0:
		sprite2d.flip_h = true
	else:
		sprite2d.flip_h = false
	if direction && state_machine.check_if_can_move():
		velocity.x = direction.x * speed
	elif state_machine.current_state != hit_state:
		velocity.x = move_toward(velocity.x, 0, speed)

	move_and_slide()
