extends TileMapLayer  

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("set tilemap")
	ChunkManager.set_tilemap(self)
	pass # Replace with function body.
