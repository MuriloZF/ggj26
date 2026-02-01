extends RigidBody2D
signal invisibleWall

func _on_player_on_player_interaction() -> void:
	invisibleWall.emit()
