extends "res://Scripts/Entity/creature.gd"


func _ready() -> void:
	speed = 100
	damage = 2


func _physics_process(_delta: float) -> void:
	var direction = (get_parent().get_node("Player").position - position).normalized()
	move(direction)
