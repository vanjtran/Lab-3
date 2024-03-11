

@export var speed = 1

#called when the node enters the scene tree for the first time.
func _ready():
	pass
	
	
# Called every frame.
func _process(delta):
	
if Input.is_action_pressed("ui_right"):
	position.x = position.x + speed
	$Animation.play("walk_right")
if Input.is_action_pressed("ui_left"): 
	position.x -= speed
	$Animation.play ("walk_left")
if Input.is_action_pressed("ui_up"):
	position.y -= speed
	$Animation.play("walk_up")
if Input.is_action_pressed("ui_down"):
	position.y += speed
	$Animation.play("walk_down")
#position.y = position.y + speed	
