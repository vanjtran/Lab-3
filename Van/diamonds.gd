extends Area2D
var score= 0
@onready var label = $"../../Control/Label"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	queue_free()
	score=+100
	print(score)
	label._updatescore(score)
	
	
	
