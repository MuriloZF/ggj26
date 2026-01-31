extends Camera2D

var target : Node2D

func _ready():
	get_target()
	
func _process(_delta):
	position = target.position

func get_target():
	var nodes = get_tree().get_nodes_in_group("player")
	target = nodes[0]
