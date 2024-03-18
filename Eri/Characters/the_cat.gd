extends CharacterBody2D
class_name Player

const SPEED = 200.0
const JUMP_VELOCITY = -340.0


#Get the gravity from the project settings to be synched with rigidbody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var can_control : bool = true

	
func _physics_process(delta):
	
	if not can_control: return
	
	#Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	# Handle jump.
	if Input.is_action_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	if Input.is_action_pressed("ui_right"):
		position.x = position.x + 1
		$Animation.play("walk_right")
	else:
		$Animation.play("walk_right")
	#Get the input direction and handle the movement/decleration. #As good practice, you should replace UI actions with custom gameplay actions.
	
	
	velocity.x = SPEED
	move_and_slide()
		
	
func handle_danger() -> void:
	print("player Died!")
	visible = false
	can_control = false
	
	await get_tree().create_timer(1).timeout
	rest_player()
	
func rest_player() -> void:
	visible = true
	can_control = true
	
 
