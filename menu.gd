extends Node2D

var dentro_da_area := false

func _process(delta: float) -> void:
	var mouse_pos = get_global_mouse_position()
	$mouse.position = mouse_pos	
	if dentro_da_area and Input.is_action_just_pressed("select"):
		get_tree().change_scene_to_file("res://main.tscn")

func _on_jogar_area_entered(area: Area2D) -> void:
	dentro_da_area = true

func _on_jogar_area_exited(area: Area2D) -> void:
	dentro_da_area = false
