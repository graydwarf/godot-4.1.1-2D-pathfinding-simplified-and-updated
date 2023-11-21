# Author : Shaun Harbison
# MIT License : 2022
# 3.x: https://github.com/cyborg-kenneth/pathfinding-demo/tree/main
# 4.x Revisions : Poplava

extends Control

var selected = false
func _ready():
	$AnimationPlayer.play("spin")

func _process(_delta : float) -> void:
	if selected:
		global_position = get_global_mouse_position()

func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.pressed:
			if event.button_index == MOUSE_BUTTON_LEFT:
				selected = true
		else:
			selected = false

