extends Node

var players_ready = 0;

func is_ready():
	players_ready = 2;
	
func player_ready():
	players_ready += 1;
	
func clear_ready():
	players_ready = 0;
