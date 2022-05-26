extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.


func _on_player_toogle_pause(event):
	print(event)

func _process(_delta):
	if Input.is_action_pressed("reanudar"):
		 get_tree().paused = false


func _on_ball_win():
	print("GANA")
	$player.pause_mode = Node.PAUSE_MODE_STOP
	get_tree().paused = true
	pause_mode = Node.PAUSE_MODE_STOP
	var replay_scn = load("res://title/replay.tscn")
	add_child(replay_scn.instance())
	$ball.queue_free()


func _on_ball_loose():
	print("PIERDE")
	$player.pause_mode = Node.PAUSE_MODE_STOP
	get_tree().paused = true
	pause_mode = Node.PAUSE_MODE_STOP
	var replay_scn = load("res://title/replay.tscn")
	add_child(replay_scn.instance())
	$ball.queue_free()
