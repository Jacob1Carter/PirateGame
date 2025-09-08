extends Node3D

var speed = 50
var direction = Vector3.ZERO

var lifetime : int = 0

func set_direction(dir: Vector3) -> void:
	direction = dir.normalized()

func _process(delta):
	print_debug(delta)
	if not direction.is_equal_approx(Vector3.ZERO):
		global_translate(direction * speed * delta)
	
	lifetime += 1


func _on_area_3d_body_entered(body: Node3D) -> void:
	print_debug("HIT")
	queue_free()


func _on_area_3d_body_exited(body: Node3D) -> void:
	pass # Replace with function body.
