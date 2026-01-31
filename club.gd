extends Node

var phrases = ["Hi", "Hey", "Sup", "Oi", "Olá"]

func _on_player_on_player_interaction() -> void:
	$Enemy/phraseLayer.showMessage(phrases.pick_random())
