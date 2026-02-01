extends RigidBody2D
signal npcHit

func _ready():
	var maskTypes = Array($AnimatedSprite2D.sprite_frames.get_animation_names())
	$AnimatedSprite2D.animation = maskTypes.pick_random()
	$AnimatedSprite2D.play()
	#body_entered.connect(_on_body_entered)

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free() # clear npc when it leave the screen

func _on_body_entered(body):
	npcHit.emit()
	queue_free()

func _on_player_on_player_interaction() -> void:
	get_tree().change_scene_to_file("res://boss_fight.tscn")
	queue_free()
