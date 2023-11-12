extends Area2D

@onready var powerSound =$Power 

func _on_body_entered(body):
	if body.name == "Player" or body.name == "Player2" or body.name == "Player3":
		powerSound.play()
		get_node("AnimatedSprite2D").play("Power")
		await get_node("AnimatedSprite2D").animation_finished
		self.queue_free()
		Game.power = true
