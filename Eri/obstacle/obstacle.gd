extends Node2D


 

func _on_detection_area_area_entered(area):
	if area.get_parent() is CharacterBody2D:
		area.get_parent().die()
