extends Node
class_name ClimbState

# Define Player constant values
const CLIMB_VELOCITY: int = 200;
const NO_VELOCITY: int = 0;

var velocity: Vector2 = Vector2();

func clear_velocity():
	velocity = Vector2();

func play_animation():
	if velocity.y == 0 && velocity.x == 0:
		$"../../Animation".stop();
	else:
		$"../../Animation".play("Climb");


# Player movement function
func climb_movement(player_number: String):
	if player_number == "player1":
		if Input.is_action_pressed("ui_right_1"):
			velocity.x = CLIMB_VELOCITY;
		if Input.is_action_pressed("ui_left_1"):
			velocity.x = -CLIMB_VELOCITY;
		if Input.is_action_pressed("ui_up_1"):
			velocity.y = -CLIMB_VELOCITY;
		if Input.is_action_pressed("ui_down_1"):
			velocity.y = CLIMB_VELOCITY;
		if Input.is_action_just_released("ui_left_1") || Input.is_action_just_released("ui_right_1"):
			velocity.x = NO_VELOCITY;
		if Input.is_action_just_released("ui_up_1") || Input.is_action_just_released("ui_down_1"):
			velocity.y = NO_VELOCITY;
	elif player_number == "player2":
		if Input.is_action_pressed("ui_right_2"):
			velocity.x = CLIMB_VELOCITY;
		if Input.is_action_pressed("ui_left_2"):
			velocity.x = -CLIMB_VELOCITY;
		if Input.is_action_pressed("ui_up_2"):
			velocity.y = -CLIMB_VELOCITY;
		if Input.is_action_pressed("ui_down_2"):
			velocity.y = CLIMB_VELOCITY;
		if Input.is_action_just_released("ui_left_2") || Input.is_action_just_released("ui_right_2"):
			velocity.x = NO_VELOCITY;
		if Input.is_action_just_released("ui_up_2") || Input.is_action_just_released("ui_down_2"):
			velocity.y = NO_VELOCITY;
	return velocity;
