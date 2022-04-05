extends RigidBody2D

var game_started = false

func _input(event):
	if event.is_action_pressed("iniciar") and !game_started:
		linear_velocity = Vector2(50, -200)
		game_started = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_player_contact_ball(pos):
	if !game_started:
		position.x = pos

func _physics_process(_delta):
	for body in get_colliding_bodies():
		if body.is_in_group("gr_blocks"):
			body.queue_free()
			if body.get_parent().get_child_count() == 1:
				print("GANA")
				queue_free()
	if position.y > 512:
		print("PIERDE")
		queue_free()
		var replay_scn = load("res://title/replay.tscn")
		get_parent().add_child(replay_scn.instance())
		get_tree().paused = true
