extends Node


var inimigo = preload("res://Nodes/inimigo.tscn")
export var player:NodePath
var timer:Timer
var tela:Vector2 = Vector2(1920,1080)

func _ready() -> void:
	timer = Timer.new()
	timer.wait_time = 2.0
	timer.autostart = true
	add_child(timer)
	timer.start()
	timer.connect("timeout",self,"_on_spawn_timeout")

func _on_spawn_timeout():
	var inimigo_instancia = inimigo.instance()
	inimigo_instancia.position = Vector2(rand_range(0,tela.x),rand_range(0,tela.y))
	inimigo_instancia.set_inimigo(get_node(player))
	add_child(inimigo_instancia)

