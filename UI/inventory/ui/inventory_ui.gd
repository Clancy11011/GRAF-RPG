extends Control


func _ready():
	visible = false

func _input(event):
	if event.is_action_pressed("inventory"):
		visible = !visible
		
		
