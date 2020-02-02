extends CanvasLayer

var initialTime: int = 3
var time = 30;
var final = ""

func _ready():
	$InitialTime.start()
	pass

func _process(delta):
	$P1.text = "Player1: " + str(Global.p1_score)
	$P2.text = "Player2: " + str(Global.p2_score)
	$Time.text = str(time)
		

func _on_InitialTime_timeout():
	if initialTime > -1:
		if initialTime == 0:
			$ReadyTime.text = "GO!"
			get_tree().call_group("game", "start")
		else:
			$ReadyTime.text = str(initialTime)
		$InitialTime.start()
	else:
		$ReadyTime.visible = false;
		$Timer.start()
	initialTime -= 1
	pass


func _on_Timer_timeout():
	time -= 1;
	if time == 0:
		get_tree().call_group("game", "finish")
		if Global.p1_score > Global.p2_score:
			final = "P1 WINS!";
		if Global.p1_score < Global.p2_score:
			final = "P2 WINS!";
		else:
			final = "DRAW!";
		$Win.visible = true;
		$Win.text = final;
	if time > 0:
		$Timer.start()
	
	pass
