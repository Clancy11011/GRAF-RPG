extends CharacterBody2D
class_name Guard

func _physics_process(delta):
	move_and_slide()

	#if velocity.length() > 0:
	#	$AnimationPlayer.play("Walk")
	
	#if velocity.x > 0:
	#	$Sprite.flip_h = false
	#else:
	#	$Sprite.flip_h = true
