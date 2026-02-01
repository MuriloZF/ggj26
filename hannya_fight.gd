extends Node
@export var maskScene : PackedScene = preload("res://mask.tscn")
@onready var player: CharacterBody2D = $player
@onready var hannya: RigidBody2D = $hannya

func _ready():
	$player.verticalMovement = false
	$player.hannya = true
	$fightTimer.start()

func end_fight():
	get_tree().call_group("mask", "queue_free")

func _on_fight_timer_timeout() -> void:
	$maskTimer.stop()
	player.win += player.win
	get_tree().change_scene_to_file("res://main.tscn")
	
