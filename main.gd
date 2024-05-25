extends Node2D

@onready var canvas_layer = $UIOverlay
@onready var ui = $UIOverlay/DayNightCycleUI
@onready var sound_machine = $SoundMachine
@onready var canvas_modulate = $CanvasModulate

# Called when the node enters the scene tree for the first time.
func _ready():
	canvas_layer.visible = true
	canvas_modulate.time_tick.connect(ui.set_daytime)
	canvas_modulate.time_tick.connect(sound_machine.set_daytime)
