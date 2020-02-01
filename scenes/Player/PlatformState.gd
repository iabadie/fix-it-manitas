extends Node
class_name PlatformState

# Define Player constant values
const MOVE_VELOCITY: int = 300;
const NO_VELOCITY: int = 0;
const GRAVITY_FORCE: int = 10;

var velocity: Vector2 = Vector2();
var is_idle: bool = true;

# Player movement function
func platform_movement(is_on_floor: bool, player_number: String):
	if player_number == "player1":
		if !is_on_floor:
			velocity.y += GRAVITY_FORCE;
		if Input.is_action_pressed("ui_right_1"):
			velocity.x = MOVE_VELOCITY;
			$"../../Animation".flip_h = false;
		if Input.is_action_pressed("ui_left_1"):
			velocity.x = -MOVE_VELOCITY;
			$"../../Animation".flip_h = true;
		if Input.is_action_just_released("ui_left_1") || Input.is_action_just_released("ui_right_1"):
			velocity.x = NO_VELOCITY;
		if Input.is_action_pressed("ui_up_1"):
			velocity.y = -GRAVITY_FORCE - MOVE_VELOCITY;
		if Input.is_action_just_released("ui_left_1") || Input.is_action_just_released("ui_right_1"):
			velocity.x = NO_VELOCITY;
		if Input.is_action_just_released("ui_up_1") || Input.is_action_just_released("ui_down_1"):
			velocity.y = NO_VELOCITY;
	elif player_number == "player2":
		if !is_on_floor:
			velocity.y += GRAVITY_FORCE;
		if Input.is_action_pressed("ui_right_2"):
			velocity.x = MOVE_VELOCITY;
			$"../../Animation".flip_h = false;
		if Input.is_action_pressed("ui_left_2"):
			velocity.x = -MOVE_VELOCITY;
			$"../../Animation".flip_h = true;
		if Input.is_action_just_released("ui_left_2") || Input.is_action_just_released("ui_right_2"):
			velocity.x = NO_VELOCITY;
		if Input.is_action_pressed("ui_up_2"):
			velocity.y = -GRAVITY_FORCE - MOVE_VELOCITY;
		if Input.is_action_just_released("ui_left_2") || Input.is_action_just_released("ui_right_2"):
			velocity.x = NO_VELOCITY;
		if Input.is_action_just_released("ui_up_2") || Input.is_action_just_released("ui_down_2"):
			velocity.y = NO_VELOCITY;
		
	if velocity.y >= 0 && velocity.x == 0:
		is_idle = true;
	else:
		is_idle = false;
		
	return velocity;

func clear_velocity():
	velocity = Vector2();
	
func play_animation():
	if is_idle:
		$"../../Animation".play("IDLE");
	else:
		$"../../Animation".play("Walk");

