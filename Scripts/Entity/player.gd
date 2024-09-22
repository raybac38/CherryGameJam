extends  "res://Scripts/Entity/creature.gd"


signal health_changed(new_health)


var hunger = 0


func _physics_process(_delta: float) -> void:

	var direction:Vector2 = Vector2(0,0)

	if Input.is_action_pressed("up"):
		direction.y -= 1 * speed
	if Input.is_action_pressed("down"):
		direction.y = 1 * speed
	if Input.is_action_pressed("right"):
		direction.x = 1 * speed
	if Input.is_action_pressed("left"):
		direction.x -= 1 * speed
	move(direction.normalized())
	
	## Test code
	if Input.is_action_just_pressed("mouse1"):
		var new_area = ChunkManager.generate_new_playable_area(Vector2i(0, 0))	## METTRE LA DIRECTION (JOUEUR BALISE)
		ChunkManager.add_new_area(new_area, position)


func _process(_delta: float) -> void:
	pass


func set_hp(n: int) -> void:
	health = n
	if health > max_health:
		health = max_health
	elif health < 0:
		health = 0
	health_changed.emit(health)
	
