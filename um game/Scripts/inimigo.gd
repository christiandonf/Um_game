extends KinematicBody2D


const SPEED:float = 200.0
var target:Node2D = null
var distance_to_player:float = 0
var chase_range:float = 200
var patrol_points:Array = []
var current_patrol_point:int = 0
var tela:Vector2 = Vector2(1920,1080)


func set_inimigo(player:Node2D) -> void:
	target = player
	patrol_points = [Vector2(rand_range(0,tela.x),rand_range(0,tela.y)),Vector2(rand_range(0,tela.x),rand_range(0,tela.y)),Vector2(rand_range(0,tela.x),rand_range(0,tela.y)),Vector2(rand_range(0,tela.x),rand_range(0,tela.y)),Vector2(rand_range(0,tela.x),rand_range(0,tela.y)),Vector2(rand_range(0,tela.x),rand_range(0,tela.y)),Vector2(rand_range(0,tela.x),rand_range(0,tela.y)),Vector2(rand_range(0,tela.x),rand_range(0,tela.y))]
	

func _physics_process(_delta: float) -> void:
	if target:
		distance_to_player = position.distance_to(target.position)
		if distance_to_player <= chase_range:
			move_and_slide(position.direction_to(target.position)*SPEED)
			look_at(target.position)
		else: 
			var target_patrol_point:Vector2 = patrol_points[current_patrol_point]
			var direction_to_patrol = position.direction_to(target_patrol_point)*SPEED
			move_and_slide(direction_to_patrol)
			look_at(target_patrol_point)
			if position.distance_to(target_patrol_point) <= 20:
				current_patrol_point = (current_patrol_point + (randi()%2+1))%patrol_points.size()
				
	
