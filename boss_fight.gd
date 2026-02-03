extends Node
@export var maskScene : PackedScene = preload("res://mask.tscn")
@onready var player: CharacterBody2D = $player
var playerStartPosition = 1526

enum difficult{
	easy,
	medium,
	hard,
	very_hard,
	ultra_very_hard
}

var difficultLevel

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
		difficult.ultra_very_hard:
			$fightTimer.wait_time = 30
			$maskTimer.wait_time = 0.15

func _ready():
	if GameState.hannyaFight:
		$hannya.show()
		$hannya.freeze = false
	$player.verticalMovement = false
	setDifficult()
	update_difficult()
	$fightTimer.start()
	$maskTimer.start()

func _process(delta):
	if $player.position.y != playerStartPosition:
		$player.position.y = playerStartPosition

func setDifficult():
	if GameState.wins < 2:
		difficultLevel = difficult.easy
	elif GameState.wins == 2:
		difficultLevel = difficult.medium
	elif GameState.wins == 3:
		difficultLevel = difficult.hard
	elif GameState.wins == 4:
		difficultLevel = difficult.very_hard
	else:
		difficultLevel = difficult.ultra_very_hard 

func end_fight():
	get_tree().call_group("mask", "queue_free")

func _on_mask_timer_timeout() -> void:
	var mask = maskScene.instantiate()
	var spawn_y = $maskPath/maskSpawnLocation.global_position.y
	mask.global_position = Vector2($player.global_position.x, spawn_y)
	var direction = Vector2.DOWN.rotated(randf_range(-PI / 4, PI / 4))
	mask.rotation = direction.angle()
	mask.linear_velocity = direction * randf_range(150.0, 250.0)
	add_child(mask)
	mask.maskHit.connect(Callable($player, "_on_mask_mask_hit"))

	
func _on_fight_timer_timeout() -> void:
	GameState.wins += 1
	if GameState.hannyaFight:
		get_tree().change_scene_to_file("res://credits.tscn")
	else:
		get_tree().change_scene_to_file("res://main.tscn")

	
