extends RigidBody2D
signal hitHannya
@export var health = 15
@onready var hannya: RigidBody2D = $"."

@export var speed := 20

func _ready():
	randomize()
	linear_velocity = Vector2(0, 0)

func _physics_process(_delta):
	setDifficult()
	update_difficult()
	if global_position.y > 1780:
		reset_position()

func reset_position():
	global_position.y = -500
	global_position.x = randi_range(500, 3750)
	hannya.linear_velocity.y = 0

func _on_mask_mask_hit() -> void:
	health -= 1
	if health <= 0:
		hide()
		set_deferred("hannya", "true")
		
func _on_body_entered(body):
	if body.on_group("mask"):
		_on_mask_mask_hit()
	else:
		hitHannya.emit()
		
enum difficult{
	easy,
	medium,
	hard,
	very_hard,
	ultra_very_hard
}

var difficultLevel

func setDifficult():
	if hannya.health > 14:
		difficultLevel = difficult.easy
	elif hannya.health > 10:
		difficultLevel = difficult.medium
	elif hannya.health > 5:
		difficultLevel = difficult.hard
	elif hannya.health > 0:
		difficultLevel = difficult.very_hard
	else:
		difficultLevel = difficult.ultra_very_hard

func update_difficult():
	match difficultLevel:
		difficult.easy:
			hannya.gravity_scale = 1
		difficult.medium:
			hannya.gravity_scale = 1.2
		difficult.hard:
			hannya.gravity_scale = 1.5
		difficult.very_hard:
			hannya.gravity_scale = 1.7
		difficult.ultra_very_hard:
			hannya.gravity_scale = 2
