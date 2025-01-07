extends KinematicBody2D


const SPEED:float = 200.0
var target:Node2D = null
var distance_to_player:float = 0
var chase_range:float = 400

func _ready() -> void:
	target = get_parent().get_node("player")

func _physics_process(delta: float) -> void:
	if target:
		distance_to_player = position.distance_to(target.position)
		if distance_to_player <= chase_range:
			move_and_slide(position.direction_to(target.position)*SPEED)
