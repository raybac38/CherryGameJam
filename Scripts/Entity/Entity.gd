




class Entity extends CharacterBody2D:

	var speed : float
	var can_move : bool
	var max_health : float
	var health : float
	var invincibility : bool
	
	var can_take_effect : bool
	var is_blinded : bool
	var slowing_factor_array = []		##Effect de slow le plus élevé gagne
	var worst_slowing_factor : float
	
	
	func _init(init_speed : float = 300.0, init_can_move : bool = true, init_max_health : float = 100, init_health : float = -1,
	init_invincibility : bool = false, init_can_take_effect : bool = true) -> void:
		speed = init_speed
		can_move = init_can_move
		init_max_health = max_health
		invincibility = init_invincibility
		can_take_effect = init_can_take_effect
		
		## If health is not set, set to max health
		if init_health == -1 :
			health = max_health
		else:
				health = init_health
		
	
	func add_slowing_effect(effect_factor : float, duration : float):
		slowing_factor_array.append(effect_factor)
		await get_tree().create_timer(duration).timeout
		slowing_factor_array.erase(effect_factor)
		
	func refresh_slowing_factor():
		if slowing_factor_array.size() == 0 :
			worst_slowing_factor = 1
		else :
			slowing_factor_array.sort()
			worst_slowing_factor = slowing_factor_array[0]
	
	func set_health(new_health : int):
		health = new_health
		if health > max_health:
			health = max_health
		elif health < 0:
			health = 0
	
	
	func get_hp() -> int:
		return health
		
	func take_damage(damage : int) -> void:
		if invincibility : return
		
		health -= damage
		if(health < 0):
			health = 0
	
	func move(direction: Vector2) -> void:
		if can_move:
			velocity = direction.normalized() * speed * worst_slowing_factor
			move_and_slide()

	func set_max_health(new_max_health : float) -> void:
		max_health = new_max_health
