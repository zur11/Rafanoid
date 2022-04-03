extends KinematicBody2D

const RIGHT = 1
const LEFT = -1

export var speed = 4

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(_delta):
	if Input.is_action_pressed("mover_derecha"):
		position.x += speed
	if Input.is_action_pressed("mover_izquierda"):
		position.x -= speed
