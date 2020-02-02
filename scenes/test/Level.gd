extends Node2D

func _ready():
	get_tree().paused = true;
	
func start():
	get_tree().paused = false;
	pass
	
func end():
	get_tree().paused = true;
