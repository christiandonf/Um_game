extends AnimatedSprite

# Declare member variables here. Examples:
const SPEED : int = 400
var screen_size
export var cocacola : float = 1
export var jogo : bool = false
var vida : int = 15

func _gethealth():
	var getvida = vida
	return getvida

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	vida = 20.1
	print(_gethealth())

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Input.get_vector("move_left","move_right","move_up","move_down")
	if velocity.length() > 0:
		velocity = velocity.normalized() * SPEED * cocacola
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
