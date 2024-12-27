extends AnimatedSprite

signal hit
# Declare member variables here. Examples:
const SPEED : int = 400
onready var screen_size = get_viewport_rect().size
onready var anim = $"."
onready var collision = $"../collision"

export var cocacola : float = 1
export var jogo : bool = false
var vida : int = 15

func _gethealth():
	var getvida = vida
	return getvida

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	vida = 20.1
	print(_gethealth())

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Input.get_vector("move_left","move_right","move_up","move_down")
	if velocity.length() > 0:
		velocity = velocity.normalized() * SPEED * cocacola
	
	if velocity.x != 0:
		anim.play("move")
	elif velocity.y > 0:
		anim.play("move up")
	elif velocity.y < 0:
		anim.play("move down")
	else:
		anim.play("idle")
	
	
	
	anim.flip_h = true if velocity.x > 0 else false
	
	position += velocity * delta
	#position = position.clamp(Vector2.ZERO, screen_size)
	
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)


func _on_player_body_entered(body):
	hide()
	hit.emit()
	collision.set_deferred("disabled", true)

func start_pos(pos):
	position = pos
	show()
	collision.disabled = false
