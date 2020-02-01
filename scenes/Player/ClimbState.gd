extends Node
class_name ClimbState

# Define Player constant values
const CLIMB_VELOCITY: int = 200;
const NO_VELOCITY: int = 0;

var velocity: Vector2 = Vector2();

# Player movement function
func climb_movement():
	if Input.is_action_pressed("ui_right"):
		velocity.x = CLIMB_VELOCITY;
	if Input.is_action_pressed("ui_left"):
		velocity.x = -CLIMB_VELOCITY;
	if Input.is_action_pressed("ui_up"):
		velocity.y = -CLIMB_VELOCITY;
	if Input.is_action_pressed("ui_down"):
		velocity.y = CLIMB_VELOCITY;
	if Input.is_action_just_released("ui_left") || Input.is_action_just_released("ui_right"):
		velocity.x = NO_VELOCITY;
	if Input.is_action_just_released("ui_up") || Input.is_action_just_released("ui_down"):
		velocity.y = NO_VELOCITY;
	return velocity;

func clear_velocity():
	velocity = Vector2();

#if velocity.y == 0 && velocity.x == 0:
#	$"../../Animation".stop("Climb");
	
#func play_animation():
#	$"../../Animation".play("Climb");

func play_animation():
	if velocity.y == 0 && velocity.x == 0:
		$"../../Animation".stop();
	else:
		$"../../Animation".play("Climb");
