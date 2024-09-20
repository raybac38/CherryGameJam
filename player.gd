extends "res://creature.gd"


func _physics_process(delta: float) -> void:
	var direction:Vector2 = Vector2(0,0)
	if Input.is_action_pressed("up"):
		direction.y = 1
	if Input.is_action_pressed("down"):
		direction.y -= 1
	if Input.is_action_pressed("right"):
		direction.x = 1
	if Input.is_action_pressed("left"):
		direction.x -= 1
	move(direction.normalized())
	

func _process(delta: float) -> void:
	pass
