extends Area2D


@onready var world = $".."

func _on_body_entered(body):
	if body.name == "Player":
		get_node("AnimatedSprite2D").play("Opened")
		await get_node("AnimatedSprite2D").animation_finished
		if world.name == "World":
			get_tree().change_scene_to_file("res://world2.tscn")
		if world.name == "World2":
			get_tree().change_scene_to_file("res://world3.tscn")
		if world.name == "World3":
			get_tree().change_scene_to_file("res://fin.tscn")
	
