extends Node

func _on_npc_hit() -> void:
	pass

func _on_area_2d_body_entered(body: Node2D) -> void:
	GameState.battle += 1
	if GameState.battle >= 5:
		get_tree().change_scene_to_file("res://hannya_fight.tscn")
	else:
			get_tree().change_scene_to_file("res://boss_fight.tscn")
