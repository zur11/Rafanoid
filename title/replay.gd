extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_replay_btn_pressed():
	var _replay = get_tree().change_scene("res://world.tscn")
	get_tree().paused = false

func _on_quit_btn_pressed():
	get_tree().quit()

func _physics_process(_delta):
	if Input.is_action_pressed("jugar"):
		var _replay = get_tree().change_scene("res://world.tscn")
		get_tree().paused = false
	elif Input.is_action_pressed("salir"):
		get_tree().quit()
