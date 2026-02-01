extends RigidBody2D
@export var health = 15

func _ready():
	pass	


func _on_mask_mask_hit() -> void:
	health -= 1
	if health <= 0:
		hide()
		set_deferred("hannya", "true")
