extends RigidBody2D

signal win
signal loose

onready var break_s : AudioStreamPlayer = get_node("break")
onready var start_s : AudioStreamPlayer = get_node("start")
onready var hit_s : AudioStreamPlayer = get_node("hit")
onready var lose_s : AudioStreamPlayer = get_node("lose")
onready var you_win_s : AudioStreamPlayer = get_node("you_win")

var game_started = false

func _input(event):
	if event.is_action_pressed("iniciar") and !game_started:
		linear_velocity = Vector2(50, -200)
		game_started = true
		start_s.play()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_player_contact_ball(pos):
	if !game_started:
		position.x = pos

func _physics_process(_delta):
	
	if position.y == 530:
		queue_free()
		emit_signal("loose")

	for body in get_colliding_bodies():
		if body.is_in_group("gr_blocks"):
			body.queue_free()
			break_s.play()
			
			if body.get_parent().get_child_count() == 1:
				emit_signal("win", body)
				you_win_s.play()
				yield(you_win_s, "finished")
			
		elif body.get_name() == "bord_bottom":
			lose_s.play()
			yield(lose_s,"finished")
			queue_free()
			emit_signal("loose")
			
		else:
			hit_s.play()
	
	

