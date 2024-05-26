extends Control

var is_open = false


func close():
	visible = false
	is_open = false


func open():
	visible = true
	is_open = true


# Called when the node enters the scene tree for the first time.
func _ready():
	close()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("q"):
		if is_open:
			close()
		else:
			open()
	pass
