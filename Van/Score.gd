extends Label

var score=0

# Called when the node enters the scene tree for the first time.
func _ready():
	_updatescore(0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _updatescore(newscore):
	score+=newscore
	text=str("score:",score)
