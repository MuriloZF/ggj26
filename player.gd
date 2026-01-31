extends CharacterBody2D
signal collision
@export var speed = 400
@export var health = 5

func _ready():
	pass
			
func _physics_process(delta):
	# Player movement
	velocity = Vector2.ZERO
	if Input.is_action_pressed("right"):
		velocity.x += 1
	if Input.is_action_pressed("left"):
		velocity.x -= 1
	if Input.is_action_pressed("up"):
		velocity.y -= 1
	if Input.is_action_pressed("down"):
		velocity.y += 1
	
	# Normalize the speed + animation
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$playerAnimation.play()
	else:
		$playerAnimation.stop()
		pass
	'''
	# Clamps player (won't leave the screen)
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screenSize)
	'''
	move_and_slide()
	# Sets animation
	if velocity.x == 0 && velocity.y == 0: # is standing
		$playerAnimation.animation = "idle"
		$playerAnimation.flip_v = false
		$playerAnimation.flip_h = true
		
	elif velocity.x > 0: # moving right
		$playerAnimation.animation = "side"
		$playerAnimation.flip_v = false
		$playerAnimation.flip_h = true
		
	elif velocity.x < 0: # moving left
		$playerAnimation.animation = "side"
		$playerAnimation.flip_v = false
		$playerAnimation.flip_h = false

	elif velocity.y < 0: # moving up
		$playerAnimation.animation = "up"
		$playerAnimation.flip_v = false
		$playerAnimation.flip_h = false
		
	elif velocity.y > 0: # moving down
		$playerAnimation.animation = "down"
		$playerAnimation.flip_v = false
		$playerAnimation.flip_h = false

func start(pos):
	position = pos
	
func _on_mask_mask_hit() -> void:
	health -= 1
	if health <= 0:
		hide()
		set_deferred("player", "true")
	get_parent().get_node("healthCanvas/heartContainer").takeDamage(health)
	
