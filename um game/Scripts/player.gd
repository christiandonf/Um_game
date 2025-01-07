extends KinematicBody2D

enum State{
	IDLE,
	MOVE,
	RUN
}
var current_state = State.IDLE
var speed:float = 200
var direction:Vector2 = Vector2.ZERO
var speed_run:float = 700

func _process(_delta:float):
	direction = Input.get_vector("move_left","move_right","move_up","move_down",0)
	if direction.length() > 0&&Input.get_action_raw_strength("run_button"):
		change_State(State.RUN)
	elif direction.length() > 0:
		change_State(State.MOVE)
	else:
		 change_State(State.IDLE)

func _physics_process(_delta: float) -> void:
	match current_state:
		State.IDLE:
			pass
		State.MOVE:
			player_Move(speed)
		State.RUN:
			player_Move(speed_run)

func player_Move(_speed:float):
	move_and_slide(direction*_speed)

func change_State(new_state):
	if current_state != new_state:
		current_state = new_state
