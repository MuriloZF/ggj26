extends CanvasLayer

func _ready():
	hide()

func show_message(text):
	$phrase.text = text 
	$phrase.show()
	if Input.is_action_pressed("interaction"):
		$phrase.hide()
	
	
