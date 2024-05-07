extends CharacterBody2D
class_name GuardEnemy

#@export var move_speed : float = 10
#@export var starting_direction : Vector2 = Vector2(0, 1)

#@onready var animation_tree = $AnimationTree

#func _ready():
	#update_animation_parameters(starting_direction)

func _physics_process(delta):
	move_and_slide()
	
	if velocity.length() > 0:
		$AnimationPlayer.play("walk_down")
		
	if velocity.x > 0:
		$Sprite2D.flip_h = false
	else:
		$Sprite2D.flip_h = true

