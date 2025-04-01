extends Node3D

const ROT_SPEED = 2.0  # Degrees per second

func _process(delta: float) -> void:
	rotate_y(deg_to_rad(ROT_SPEED) * delta)  # Rotate continuously


func _on_body_entered(_body: Node3D) -> void:
	queue_free()
