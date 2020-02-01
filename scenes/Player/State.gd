extends KinematicBody2D

class_name State
# Define player states
enum STATES { CLIMB, PLATFORM };

# define physics
const NORMAL_FLOOR: Vector2 = Vector2(0, -1)
var velocity: Vector2 = Vector2()
# state
var state = STATES.CLIMB

# Player processing
func _physics_process(delta):
	if state == STATES.CLIMB:
		velocity = $State/ClimbState.climb_movement();
	else:
		velocity = $State/PlatformState.platform_movement(is_on_floor());
	move_and_slide(velocity, NORMAL_FLOOR);

func change_state(new_state: int):
	state = new_state;
	clear_velocity();

func clear_velocity():
	$State/PlatformState.clear_velocity();
	$State/ClimbState.clear_velocity();
