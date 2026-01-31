extends RigidBody2D
signal npcHit

func _ready():
	body_entered.connect(_on_body_entered)

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free() # clear npc when it leave the screen

func _on_body_entered(body):
	npcHit.emit()
	queue_free()
