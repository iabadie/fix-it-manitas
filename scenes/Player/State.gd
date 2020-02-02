extends KinematicBody2D

# Define player states
enum STATES { CLIMB, PLATFORM, ACTION, PUSH };

export (String, "player1", "player2") var player_number;

# define physics
const NORMAL_FLOOR: Vector2 = Vector2(0, -1)
var velocity: Vector2 = Vector2()
# state
var state = STATES.CLIMB

# Player processing
func _physics_process(delta):
	if is_on_floor() && state != STATES.ACTION:
		change_state(STATES.PLATFORM);
	
	if state == STATES.CLIMB:
		velocity = $State/ClimbState.climb_movement(player_number);
		$State/ClimbState.play_animation();
	elif state == STATES.ACTION:
		velocity = Vector2();
		$State/ActionState.play_animation();
	else:
		velocity = $State/PlatformState.platform_movement(is_on_floor(), player_number);
		$State/PlatformState.play_animation();
	move_and_slide(velocity, NORMAL_FLOOR);

func change_state(new_state: int):
	state = new_state;
	clear_velocity();

func clear_velocity():
	$State/PlatformState.clear_velocity();
	$State/ClimbState.clear_velocity();
