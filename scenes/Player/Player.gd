extends KinematicBody2D

# Define player states
enum STATES { CLIMB, PLATFORM };

# Define Player constant values
const CLIMB_VELOCITY: int = 200;
const MOVE_VELOCITY: int = 100;
const NO_VELOCITY: int = 0;
const GRAVITY_FORCE: int = 10;
const NORMAL_FLOOR: Vector2 = Vector2(0, -1)

# Define player variables
var velocity: Vector2 = Vector2();
var state: int = STATES.CLIMB;

# Player processing
func _physics_process(delta):
	if state == STATES.CLIMB:
		climb_movement();
	else:
		platform_movement();
	move_and_slide(velocity, NORMAL_FLOOR);

# Player movement functions
func platform_movement():
	if !is_on_floor():
		velocity.y += GRAVITY_FORCE;
	if Input.is_action_pressed("ui_right"):
		velocity.x = MOVE_VELOCITY;
	if Input.is_action_pressed("ui_left"):
		velocity.x = -MOVE_VELOCITY;
	if Input.is_action_just_released("ui_left") || Input.is_action_just_released("ui_right"):
		velocity.x = NO_VELOCITY;
	if Input.is_action_pressed("ui_up"):
		velocity.y = -GRAVITY_FORCE - MOVE_VELOCITY
	pass
	
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

# Player signals conection
func _on_Area_area_entered(area):
	if area.name == "PlayerDetectionArea":
		state = STATES.PLATFORM;

func _on_Area_area_exited(area):
	if area.name == "PlayerDetectionArea":
		state = STATES.CLIMB;
		velocity.y = NO_VELOCITY;
	
