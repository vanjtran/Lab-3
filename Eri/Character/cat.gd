extends CharacterBody2D

signal spawning

@onready var animation_player = $"Animation Player"

const SPEED = 200.0
const JUMP_VELOCITY = -330.0


@onready var respawn_point = $"../Checkpoints/Spawn1"

# Get the gravity from the project settings to be synced with RigidBody nodes.
var default_gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var gravity = default_gravity


var alive = true

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	
	velocity.x = SPEED
	
	
	if alive:
		if is_on_floor():
			if Input.is_action_pressed("ui_right"):
				position.x = position.x + 1
				$Animation.play("ui_right")
				
	else:
			if velocity.y < 0:
				animation_player.play("die")
	
	move_and_slide()
func respawn():
	position = respawn_point.position
	print("respawning")
	emit_signal("spawning")
	gravity = default_gravity
	alive = true
	animation_player.play("ui_right")
	move_and_slide()

func kill():
	alive = false
	gravity= 0
	velocity.y = 0
	animation_player.play("die")

func _on_animation_player_animation_finished():
	respawn()
