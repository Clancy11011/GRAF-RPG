extends Camera2D

@export var tilemap: TileMap
#@export var TIME_SCALE: float = 0.1
#@export var RADIUS: float = 60
 
var time = 0


func _ready():
	var mapRect = tilemap.get_used_rect()
	var tileSize = tilemap.cell_quadrant_size
	var worldSizeInPixels = mapRect.size * tileSize
	limit_right = worldSizeInPixels.x
	limit_bottom = worldSizeInPixels.y
	
func _process(delta):
	#time += delta * TIME_SCALE
	#position.x = sin(time) * RADIUS
	#position.y = cos(time) * RADIUS
	pass
