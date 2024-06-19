extends Node2D

@export var newScenePath: String
@onready var interaction_area: InteractionArea = $InteractionArea

func _ready():
	interaction_area.interact = Callable(self, "_on_enter")


func _on_enter():
	#play animation or sound effects
	var player = get_tree().get_first_node_in_group("Player")
	Global.playerPostion = player.global_position
	Global.previousScene = get_tree().current_scene.get_path()
	get_tree().change_scene_to_file("res://casino.tscn")



