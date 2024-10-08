extends  "res://Scripts/Entity/creature.gd"


var hunger = 0


func _ready():
	pass


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
	if Input.is_action_just_pressed("sprint"):
		speed *= 1.5
	elif Input.is_action_just_released("sprint"):
		speed /= 1.5 
	move(direction.normalized())
	
	## Test code
	if Input.is_action_just_pressed("mouse1"):
		var new_area = ChunkManager.generate_new_playable_area(Vector2i(0, 0))	## METTRE LA DIRECTION (JOUEUR BALISE)
		ChunkManager.add_new_area(new_area, position)


func set_hp(n: int) -> void:
	health = n
	if health > max_health:
		health = max_health
	elif health < 0:
		health = 0
	var health_bar = get_node("../../GUI/HealthBar")
	health_bar.value = health
	if health == 0:
		pass #mort
