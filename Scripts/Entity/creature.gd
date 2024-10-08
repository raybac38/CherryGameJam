extends CharacterBody2D


var speed = 300.0
var max_health = 10
var health = max_health
var damage = 1
var iframes = 60
var looking_right = true


func _process(_delta: float) -> void:
	if iframes>0:
		iframes -= 1


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
	iframes = 60
	

func move(direction: Vector2) -> void:
	if direction.x > 0 and not looking_right:
		looking_right = true
		for child in get_children():
			if child is Sprite2D:
				child.flip_h = false
	elif direction.x < 0 and looking_right:
		looking_right = false
		for child in get_children():
			if child is Sprite2D:
				child.flip_h = true	
	velocity = direction * speed
	move_and_slide()
	
