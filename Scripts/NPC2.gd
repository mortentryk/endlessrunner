extends CharacterBody3D

@export var move_speed := 2.0
@export var walk_direction := Vector3.FORWARD

@onready var anim_player: AnimationPlayer = $Walk/AnimationPlayer

func _ready() -> void:
	if anim_player and anim_player.has_animation("mixamo_com"):
		anim_player.play("mixamo_com")

func _physics_process(delta: float) -> void:
	velocity = walk_direction * move_speed
	move_and_slide()

	#$Walk/AnimationPlayer.play("mixamo_com")
