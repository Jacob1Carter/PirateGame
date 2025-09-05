extends Node3D

var speed = 50
var direction = Vector3.ZERO

func set_direction(dir: Vector3) -> void:
	direction = dir.normalized()

func _process(delta):
	if not direction.is_equal_approx(Vector3.ZERO):
		global_translate(direction * speed * delta)
