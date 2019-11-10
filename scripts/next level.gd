extends Node2D

export var next_level=String()

func _on_next_level_body_entered(body):
	if body.is_in_group("player"):
		get_tree().change_scene(next_level)
