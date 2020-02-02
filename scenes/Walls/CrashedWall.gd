extends Node2D

# Wall exported method for interface builder
export var MAX_WALL_LIFE: int = 200;
export var initial_value: int = 100;

# Wall constants
const NO_LIFE: int = 0;

# Wall variables
var wall_life: int = initial_value;

# Wall processing
func _ready():
	$LifeBar.max_value = MAX_WALL_LIFE
	$LifeBar.value = initial_value
	pass

func _process(delta):
	$LifeBar.value = wall_life;
	#wall_sprite();

# Wall life methods
func fix_wall(amount: int = 10):
	if wall_life < MAX_WALL_LIFE:
		wall_life += amount
	wall_sprite();

func crash_wall(amount: int = 10):
	if wall_life > NO_LIFE:
		wall_life -= amount
	wall_sprite();

func wall_sprite():
	if wall_life ==0:
		$cristal01.visible = true;
		$cristal02.visible = false;
		$cristal03.visible = false;
		$fx_roto.play();
	if wall_life >0 && wall_life < 100:
		$cristal01.visible = false;
		$cristal02.visible = true;
		$cristal03.visible = false;
	if wall_life >=100 && wall_life < 200:
		$cristal01.visible = false;
		$cristal02.visible = false;
		$cristal03.visible = true;
	if wall_life == 200:
		$cristal01.visible = false;
		$cristal02.visible = false;
		$cristal03.visible = false;
		$fx_reparado.play();
	
