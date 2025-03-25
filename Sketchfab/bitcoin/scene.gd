extends Node3D

const ROT_SPEED = 2 #ROTATION SPEED
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	rotate_y(deg_to_rad(ROT_SPEED))
