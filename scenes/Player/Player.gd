extends "./State.gd"

const NO_VELOCITY: int = 0;
var can_repair: bool = false;
var areaprueba: Area2D = null;

func _process(delta):
	if $Animation.animation == "Action" && $Animation.frame == 2:
		change_state(STATES.PLATFORM);
	if player_number == "player1":
		if can_repair && areaprueba != null && Input.is_action_just_pressed("Action_1"):
			areaprueba.get_parent().fix_wall();
			change_state(STATES.ACTION);
	elif player_number == "player2":
		if can_repair && areaprueba != null && Input.is_action_just_pressed("Action_2"):
			areaprueba.get_parent().crash_wall();
			change_state(STATES.ACTION);
	
	if player_number == "player1":
		if state != STATES.CLIMB && Input.is_action_just_pressed("ui_up_1"):
			change_state(STATES.CLIMB);
	elif player_number == "player2":
		if state != STATES.CLIMB && Input.is_action_just_pressed("ui_up_2"):
			change_state(STATES.CLIMB);
	
# Player signals conection
func _on_Area_area_entered(area):
	if area.name == "PlayerDetectionArea":
		change_state(STATES.PLATFORM);
	if area.name == "WallArea":
		can_repair = true;
		areaprueba = area;
	
func _on_Area_area_exited(area):
	if area.name == "PlayerDetectionArea":
		change_state(STATES.CLIMB);
		velocity.y = NO_VELOCITY;
	if area.name == "WallArea":
		can_repair = false;
		areaprueba = null;
