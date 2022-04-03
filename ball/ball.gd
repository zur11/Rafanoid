extends RigidBody2D

var game_started = false

func _input(event):
	if event.is_action_pressed("iniciar") and !game_started:
		linear_velocity = Vector2(50, -200)
		game_started = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_player_contact_ball(movement):
	if linear_velocity <= Vector2(0,0):
		position += movement
	
