extends Node
class_name PlatformState

# Define Player constant values
const MOVE_VELOCITY: int = 300;
const NO_VELOCITY: int = 0;
const GRAVITY_FORCE: int = 10;

var velocity: Vector2 = Vector2();

# Player movement function
func platform_movement(is_on_floor: bool):
	if !is_on_floor:
		velocity.y += GRAVITY_FORCE;
	if Input.is_action_pressed("ui_right"):
		velocity.x = MOVE_VELOCITY;
	if Input.is_action_pressed("ui_left"):
		velocity.x = -MOVE_VELOCITY;
	if Input.is_action_just_released("ui_left") || Input.is_action_just_released("ui_right"):
		velocity.x = NO_VELOCITY;
	if Input.is_action_pressed("ui_up"):
		velocity.y = -GRAVITY_FORCE - MOVE_VELOCITY;
	if Input.is_action_just_released("ui_left") || Input.is_action_just_released("ui_right"):
		velocity.x = NO_VELOCITY;
	if Input.is_action_just_released("ui_up") || Input.is_action_just_released("ui_down"):
		velocity.y = NO_VELOCITY;
	return velocity;

func clear_velocity():
	velocity = Vector2();
