extends Node2D

var activated = false



func _on_area_2d_body_entered(body):
	position=Vector2i(24,345)
	if !activated:
		$AnimatedSprite2D.play("default")
		body.respawn_point = self
		activated = true
	
	
func _on_animated_sprite_2d_animation_finished():
	$AnimatedSprite2D.play("default")


