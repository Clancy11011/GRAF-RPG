extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	visible = true


func _input(event):
	if event.is_action_pressed("inventory"):
		visible = !visible
