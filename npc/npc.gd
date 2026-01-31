extends RigidBody2D
signal npcCollision

func _ready():
	body_entered.connect(_on_body_entered)
	while true:
		$spriteNpc.play()

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free() # clear masks when they leave the screen

func _on_body_entered(body):
	npcCollision.emit()
