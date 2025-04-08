extends CharacterBody3D
##
## Simple left/right character controller
##
## Speed of character movement
const SPEED = 5.0

func _physics_process(_delta: float) -> void:
	var input_dir := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	# We'll ignore up and down input, just using side to side
	var direction := (transform.basis * Vector3(input_dir.x, 0, 0)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		# Keep y velocity unchanged or set to 0 if you don't want gravity
		velocity.y = velocity.y  # or 0.0 if no gravity
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		# velocity.y remains unchanged
	
	move_and_slide()
	
	var collision = get_last_slide_collision()
	if collision: 
		print("collided with:", collision.get_collider()) 
		get_tree().quit()
