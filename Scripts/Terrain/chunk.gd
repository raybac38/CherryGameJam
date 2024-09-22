extends Node

const TUILE = preload("res://Scripts/Terrain/tuile.gd")

class Chunk:
	var number_of_refereces : int = 0
	var is_generated : bool = false;
	var position : Vector2i
	var tilemap_ref : TileMapLayer
	var tuiles = []
	
	func is_position_equal(chunk :Chunk):
		return position == chunk.get_position()
	
	func get_position():
		return position
		
	func increment_references():
		number_of_refereces += 1

	func decrement_references():
		number_of_refereces -= 1
		if(number_of_refereces == 0 && is_generated):
			cleanup()	##is_generated ==> des tuiles sont afficher

	func cleanup():	## FAIRE LA FONCTION DE NETOYAGE : ENLEVER LES TUILES AFFICHER
		tile_remove()
		return

	func _init(new_position : Vector2i, new_tilemap_ref : TileMapLayer):
		if new_tilemap_ref == null: 
			printerr("tilemap_ref is null")
			
		increment_references()
		
		tilemap_ref = new_tilemap_ref
		position = new_position
		for i in range(Constante.NB_TUILE_PAR_CHUNK):
			for j in range(Constante.NB_TUILE_PAR_CHUNK):
				var tuile = TUILE.Tuile.new(Vector2i(i,j))
				add_tuile(tuile)
	
	func set_tuile_id(new_id, local_position : Vector2i):
		for i : TUILE.Tuile in tuiles:
			if(i.get_posision() == local_position):
				i.set_id(new_id)
				return
	
	func add_tuile(tuile):
		tuiles.append(tuile)
	
	func remove_tuile(tuile):
		tuiles.erase(tuile)
		
	func blank_test():
		if is_generated : return
		
		for i : TUILE.Tuile in tuiles:
			var pos = i.get_posision()
			var tuile_id = randi_range(0,6)
			i.set_id(tuile_id)
			var absolut_pos : Vector2i = pos + (position * Constante.NB_TUILE_PAR_CHUNK)
			tilemap_ref.set_cell(absolut_pos, tuile_id, Vector2i(0,0))
		is_generated = true


	func tile_remove():
		print("removing tile UI")
		for i : TUILE.Tuile in tuiles:
			var pos = i.get_posision()
			var tuile_id = -1
			i.set_id(tuile_id)
			var absolut_pos : Vector2i = pos + (position * Constante.NB_TUILE_PAR_CHUNK)
			tilemap_ref.set_cell(absolut_pos, tuile_id, Vector2i(-1, -1))
			
			
