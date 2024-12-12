extends AnimatedSprite

const SPEED := 400
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
	
	func _process(delta):
var velocity = Input.get_vector("move_left","move_right","move_up","move_down")

if velocity.length() > 0:
	velocity = velocity.normalized() * SPEED
	
	position += velocity * delta

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
