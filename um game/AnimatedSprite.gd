extends AnimatedSprite

# Declare member variables here. Examples:
const SPEED = 400
var cocacola = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Input.get_vector("move_left","move_right","move_up","move_down")

	if velocity.length() > 0:
		velocity = velocity.normalized() * SPEED * cocacola

	position += velocity * delta 
