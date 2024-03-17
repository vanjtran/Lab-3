
extends Node2D

var velocity = Vector2.ZERO

@export var speed = 300.0
@export var jump_height = -400.0


@export var health = 10
@export var booleanVar = true
# Called when the node enters the scene tree for the first time.


#Get the gravity from the project settings to be synched with rigidbody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	#Add the gravity.


# Called every frame.

	
	if Input.is_action_pressed("ui_right"):
		position.x = position.x + 1
		$Animation.play("walk_right")
	elif Input.is_action_pressed("ui_up"):
		position.y = position.y - 1
		$Animation.play("walk_up")
	elif Input.is_action_pressed("ui_down"):
		position.y = position.y + 1
		$Animation.play("walk_down")
	else:
		$Animation.play("idle")
		
		
	#if Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT):
		#position.y = position.y + speed
		
	#if health < 0:
		#hide()
	#else:
		#show()

	 
		
