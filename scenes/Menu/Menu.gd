extends Sprite

var playing_animation: bool = false
var listening_start: bool = false

func _process(delta):
	if !listening_start && !playing_animation && Global.is_ready():
		listening_start = true;
		$Start.visible = true;
		

	if listening_start && !playing_animation && (Input.is_action_just_pressed("Action_1") || Input.is_action_just_pressed("Action_2")):
		playing_animation = true;
		Animation.play("go_to_level");

func _on_Animation_animation_finished(anim_name):
	if anim_name == "go_to_level":
		get_tree().change_scene("res://scenes/test/Level.tscn");
		Global.clear_ready();
	pass
