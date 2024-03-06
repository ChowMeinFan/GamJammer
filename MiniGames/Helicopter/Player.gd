extends KinematicBody2D

const GRAVITY : int = 1000
const MAX_VEL : int = 600
const FLIGHT : int = -100
var flying : bool = false
var falling : bool = false
const START_POS = Vector2(0, 0)

var velocity = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	reset() # Replace with function body.

func reset():
	falling = false
	flying = false
	position = START_POS
	#set_rotation(0)

func _physics_process(delta):
	if flying or falling:
		velocity.y += GRAVITY * delta
		#terminal veloctiy
		if velocity.y > MAX_VEL:
			velocity.y = MAX_VEL
		move_and_collide(velocity * delta)
	#else:
		
			
func flight():
	velocity.y = FLIGHT
