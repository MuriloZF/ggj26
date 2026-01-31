extends CanvasLayer
var phrases = ["Hi", "Hey", "Sup", "Oi", "Olá"]

func showMessage(text):
	show()
	$message.text = text
	$message.show()
	$avatar.show()
	if Input.is_action_just_pressed("interact"):
		hide()
		$message.hide()
		$avatar.hide()
