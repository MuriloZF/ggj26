extends Area2D
var Enemy = preload("res://npc/npc.tscn")

var npcMax = 15
var enemies = []
var npc_falas = []

enum npcState {
		idle,
		speaking	
	}

var stats = npcState.idle

func npc_spawn():
	for i in range(npcMax):
		var enemy = Enemy.instantiate()
		
		var valid_position = false
		var x : int
		var y : int
		
		while not valid_position:
			valid_position = true
			x = randi() % 640
			y = randi() % 410
			
			for e in enemies:
				if x == int(e.position.x) and y == int(e.position.y):
					valid_position = false
					break
		
		enemy.position = Vector2(x, y)
		add_child(enemy)
		enemies.append(enemy)

func phrase():
	for i in range(npcMax):
		for j in range(3):
			var num = randi() % 20
			add_child(num)
			npc_falas.append(num)
	

func idle_state():
	pass
	
func speaking_state():
	pass

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	npc_spawn()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	match stats:
		npcState.idle: 
			idle_state()
		npcState.speaking:
			speaking_state()
		
		

func _on_body_entered(body: Node2D) -> void:
	stats = speaking_state()
