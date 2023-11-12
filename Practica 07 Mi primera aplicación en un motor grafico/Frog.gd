extends CharacterBody2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
const SPEED = 50.0
const JUMP_VELOCITY = -400.0
var player 
var chase = false

@onready var collisionSound = $Colission

func _physics_process(delta):
	velocity.y += gravity * delta
	player = get_node("../Player")
	if chase == true:
		if get_node("AnimatedSprite2D").animation != "Death":
			get_node("AnimatedSprite2D").play("Jump")
		var direction = (player.position - self.position).normalized()
		if direction.x > 0:
			get_node("AnimatedSprite2D").flip_h = true
		else:
			get_node("AnimatedSprite2D").flip_h = false
		velocity.x = direction.x * SPEED
	else:
		if get_node("AnimatedSprite2D").animation != "Death":
			get_node("AnimatedSprite2D").play("Idle")
		velocity.x = 0
	move_and_slide()

func _on_player_death_body_entered(body):
	if body.name == "Player":
		Game.gold += 3
		collisionSound.play()
		death()


func _on_player_collision_body_entered(body):
	if body.name == "Player":
		if Game.power == false:
			Game.health -= 3
		if Game.power == true:
			Game.gold += 2
		collisionSound.play()
		death()
	
	
func death():
	get_node("AnimatedSprite2D").play("Death")
	await get_node("AnimatedSprite2D").animation_finished
	self.queue_free()


func _on_player_detecion_body_entered(body):
	if body.name == "Player":
		chase = true


func _on_player_detecion_body_exited(body):
	if body.name == "Player":
		chase = false
