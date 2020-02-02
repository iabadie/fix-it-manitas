extends Node

func play_animation():
	if Input.is_action_just_pressed("Action_1"):
		$"../../Animation".play("Action");
	
	if Input.is_action_just_released("Action_1"):
		$"../../Animation".stop;

	if Input.is_action_just_pressed("Action_2"):
			$"../../Animation".play("Action");
		
	if Input.is_action_just_released("Action_2"):
			$"../../Animation".stop;
