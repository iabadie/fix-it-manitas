extends Node2D

export (String) var label_text = "Press";
export (int, 1, 2) var player_number = 1;

var can_select: bool = true

func _ready():
	$ButtonLabel.text = label_text;
	$Animation.play("binding_label");
	$PlayerReady.visible = false;
	pass
	
func _process(delta):
	if  can_select && Input.is_action_just_pressed("Action_"+str(player_number)):
		selection_ready();

func selection_ready():
	Global.player_ready();
	can_select = false;
	$Animation.stop();
	set_player()
	$Animation.play("selected");
	$ButtonLabel.visible = false;
	$PlayerReady.visible = true;
	$PlayerReady/ReadyText.text = "P" + str(player_number) + " READY!";


func set_player():
	if player_number == 1:
		$PlayerReady/AnimatedSprite.play("p1")
		$Animation.play("p1");
	else:
		var number = randi() % 2 + 2
		$PlayerReady/AnimatedSprite.play("p" + str(number));
		Global.set_player_2(number);
