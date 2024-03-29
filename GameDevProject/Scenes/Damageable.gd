extends Node

class_name Damageable

signal on_hit(node : Node, damage_taken : float, knockback_direction : Vector2)
@export var dead_animation_name : String = "Death"

@export var health : float = 15

func hit(damage : int, knockback_direction : Vector2):
	health -= damage
	
	emit_signal("on_hit", get_parent(), damage, knockback_direction)

func _on_animation_tree_animation_finished(anim_name):
	if (anim_name == dead_animation_name):
		get_parent().queue_free()
	
