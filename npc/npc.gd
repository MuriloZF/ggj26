extends Area2D
signal npcCollision

func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	npcCollision.emit()
	
