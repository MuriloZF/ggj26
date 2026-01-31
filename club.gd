extends Node

@export var npcScene : PackedScene = preload("res://npc/npc.tscn")
var phrases = ["Hi", "Hey", "Sup", "Oi", "Olá"]

func _ready():
	var npc = npcScene.instantiate()
	var spawnLocation = $pathpathNpc/spawnNpc
	spawnLocation.progress_ratio = randf()
	npc.position = spawnLocation.position
	add_child(npc)
	npc.npcCollision.connect($player._on_enemy_npc_collision())

func on_player_interaction() -> void:
	$Enemy/phraseLayer.showMessage(phrases.pick_random())
