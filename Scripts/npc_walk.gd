extends CharacterBody3D

@onready var anim_player = $Walk/AnimationPlayer 
@onready var interaction_label = $Area3D/Label3D

@export var walk_speed = 1.5
@export var point_a: Vector3
@export var point_b: Vector3

var current_target: Vector3
var is_interacting = false

func _ready():
	current_target = point_b
	interaction_label.visible = false
	anim_player.play("Idle")

func _physics_process(_delta):
	if is_interacting:
		velocity = Vector3.ZERO
		return

	var dir = (current_target - global_transform.origin).normalized()
	velocity = dir * walk_speed
	move_and_slide()

	if global_transform.origin.distance_to(current_target) < 0.5:
		current_target = point_a if current_target == point_b else point_b

	anim_player.play("Walk")

func _on_area_3d_body_entered(body):
	if body.name == "Car-tesla":
		interaction_label.visible = true

func _on_area_3d_body_exited(body):
	if body.name == "Car-tesla":
		interaction_label.visible = false

func interact():
	is_interacting = true
	velocity = Vector3.ZERO
	anim_player.play("Wave") # Sørg for at du har en "Wave"-animation
