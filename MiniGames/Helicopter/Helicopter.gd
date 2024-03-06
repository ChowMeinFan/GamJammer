extends Node2D

var game_running : bool
var game_over : bool
#var screen_size : Vector2i
#var ground_height : int
var pipes : Array
const PIPE_DELAY : int = 100
const PIPE_RANGE : int = 200

func _ready():
	new_game()

func new_game():
	game_running = false
	game_over = false
	$Player.reset()

func _input(event):
	if game_over == false:
		if event is InputEventKey :
			if event.button_index == KEY_W and event.pressed:
				if game_running == false:
					start_game()
				else:
					if $Player.flying:
						$Player.flight()

func start_game():
	game_running = true
	$Player.flying = true
	$Player.flight()
