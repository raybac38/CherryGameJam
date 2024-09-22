
extends "res://Scripts/Entity/Entity.gd"

var hunger = 0


func _physics_process(_delta: float) -> void:

	var direction:Vector2 = Vector2.ZERO

	if Input.is_action_pressed("up"):
		print("up")
		direction.y -= 1
	if Input.is_action_pressed("down"):
		direction.y += 1
	if Input.is_action_pressed("right"):
		direction.x += 1
	if Input.is_action_pressed("left"):
		direction.x -= 1
	
	move(direction.normalized())
	
	if Input.is_action_just_pressed("inventory"):
		##Opening Inventory UI
		print("Inventory")

	## Test code
	if Input.is_action_just_pressed("mouse1"):
		print("mouse pressed")
		var new_area = ChunkManager.generate_new_playable_area(Vector2i(0, 0))	## METTRE LA DIRECTION (JOUEUR BALISE)
		ChunkManager.add_new_area(new_area, position)

