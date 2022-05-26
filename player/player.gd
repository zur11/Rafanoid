extends KinematicBody2D

signal contact_ball
signal toogle_pause

const RIGHT = 1
const LEFT = -1

export var speed = 4

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(_delta):
	if Input.is_action_pressed("mover_derecha"):
		var movement = Vector2(speed, 0)
		var _bar_move = move_and_collide(movement)
		var pos = position.x
		emit_signal("contact_ball", pos)
	if Input.is_action_pressed("mover_izquierda"):
		var movement = Vector2(- speed, 0)
		var _bar_move = move_and_collide(movement)
		var pos = position.x
		emit_signal("contact_ball", pos)
	if Input.is_action_pressed("pausar"):
		get_tree().paused = true
		var game_paused = true
		emit_signal("toogle_pause", game_paused)
		pause_mode = Node.PAUSE_MODE_STOP
