extends Node
@export var maskScene : PackedScene = preload("res://mask.tscn")

func _ready():
	$fightTimer.start()
	$maskTimer.start()
	
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
	pass # finish battle
