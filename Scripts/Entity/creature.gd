extends CharacterBody2D


var speed = 300.0
var max_health = 100
var health = max_health


func set_hp(n: int) -> void:
	health = n
	if health > max_health:
		health = max_health
	elif health < 0:
		health = 0
	

func get_hp() -> int:
	return health
	

func take_damage(damage: int) -> void:
	set_hp(get_hp() - damage)
	

func move(direction: Vector2) -> void:
	velocity = direction * speed
	move_and_slide()
