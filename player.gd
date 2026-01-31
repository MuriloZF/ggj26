extends CharacterBody2D
signal collision
@export var speed = 400
@export var health = 100

func _ready():
	pass
	#hide()

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
		#play animation
	else:
		#stop animation
		pass
	'''
	# Clamps player (won't leave the screen)
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screenSize)
	'''
	move_and_slide()
	# Sets animation
	if velocity.x == 0 && velocity.y == 0: # is standing
		# play standing animation
		pass
	elif velocity.x > 0: # moving right
		# play right animation
		pass
	elif velocity.x < 0: # moving left
		# play left animation
		pass
	elif velocity.y > 0: # moving down
		# play down animation
		pass
	elif velocity.y < 0: # moving up
		# play up animation
		pass

# Collision
func _on_body_entered(body): 
	collision.emit()

func start(pos):
	position = pos
	
