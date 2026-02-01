extends Node

func _on_npc_hit() -> void:
	pass

func _on_area_2d_body_entered(body: Node2D) -> void:
	get_tree().change_scene_to_file("res://boss_fight.tscn")
