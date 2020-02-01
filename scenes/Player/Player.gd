extends State

class_name Player

const NO_VELOCITY: int = 0;

# Player signals conection
func _on_Area_area_entered(area):
	if area.name == "PlayerDetectionArea":
		change_state(STATES.PLATFORM);

func _on_Area_area_exited(area):
	if area.name == "PlayerDetectionArea":
		change_state(STATES.CLIMB);
		velocity.y = NO_VELOCITY;
	

