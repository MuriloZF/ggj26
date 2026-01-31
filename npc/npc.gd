extends Area2D
signal npcCollision



func _on_player_on_player_interaction() -> void:
	npcCollision.emit()
