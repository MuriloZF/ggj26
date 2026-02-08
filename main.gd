extends Node

func _on_npc_hit() -> void:
	pass

func _on_area_2d_body_entered(body: Node2D) -> void:
	GameState.battle += 1
	if GameState.battle >= 5:
		GameState.hannyaFight = true
	else:
		GameState.hannyaFight = false
	get_tree().call_deferred("change_scene_to_file", "res://boss_fight.tscn")
