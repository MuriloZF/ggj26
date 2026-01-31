extends HBoxContainer
var heartList : Array[TextureRect]

func _ready() -> void:
	var heartParent = $"."
	for child in heartParent.get_children():
		heartList.append(child)

func takeDamage(health):
	updateHeart(health)
	
func updateHeart(health):
	for i in range(heartList.size()):
		heartList[i].visible = i < health
		
