extends Node
@export var npcScene : PackedScene = preload("res://npc/node_2d.tscn")

var phrases = ["Hi", "Hey", "Sup", "Oi", "Olá"]

func _on_player_on_player_interaction() -> void:
	$Enemy/phraseLayer.showMessage(phrases.pick_random())

func _ready():
	var npc = npcScene.instantiate()
	var spawnLocation = $pathNpc/spawnNpc
	spawnLocation.progress_ratio = randf()
	npc.position = spawnLocation.position
	add_child(npc)
	npc.npcColission.connect($player.on_npc_colission())
