extends Node
@export var maskScene : PackedScene = preload("res://mask.tscn")
@onready var player: CharacterBody2D = $player

enum difficult{
	easy,
	medium,
	hard,
	very_hard
}

var difficultLevel

func _ready():
	$player.verticalMovement = false
	setDifficult()
	update_difficult()
	$fightTimer.start()
	$maskTimer.start()

func setDifficult():
	if player.win < 2:
		difficultLevel = difficult.easy
	elif player.win <= 4:
		difficultLevel = difficult.medium
	elif player.win <= 7:
		difficultLevel = difficult.hard
	else:
		difficultLevel = difficult.very_hard

func update_difficult():
	match difficultLevel:
		difficult.easy:
			$fightTimer.wait_time = 15
			$maskTimer.wait_time = 0.5
		difficult.medium:
			$fightTimer.wait_time = 20
			$maskTimer.wait_time = 0.4
		difficult.hard:
			$fightTimer.wait_time = 25
			$maskTimer.wait_time = 0.3
		difficult.very_hard:
			$fightTimer.wait_time = 30
			$maskTimer.wait_time = 0.2

func end_fight():
	get_tree().call_group("mask", "queue_free")

func _on_mask_timer_timeout() -> void:
	var mask = maskScene.instantiate()
	var spawnLocation = $maskPath/maskSpawnLocation
	spawnLocation.progress_ratio = randf()
	mask.position = spawnLocation.position
	var direction = spawnLocation.rotation + PI / 2
	direction += randf_range(-PI / 4, PI / 4)
	mask.rotation = direction
	var velocity = Vector2(randf_range(150.0, 250.0), 0.0)
	mask.linear_velocity = velocity.rotated(direction)
	add_child(mask)
	mask.maskHit.connect($player._on_mask_mask_hit)
	
func _on_fight_timer_timeout() -> void:
	$maskTimer.stop()
	player.win += player.win
	get_tree().change_scene_to_file("res://main.tscn")

	
