extends Area2D

var damage : int = 100

func _on_body_entered(body):
	if (body.name == "Player"):
		get_tree().reload_current_scene()
	for child in body.get_children():
		if child is Damageable:
				child.hit(damage, Vector2(0, 1))
