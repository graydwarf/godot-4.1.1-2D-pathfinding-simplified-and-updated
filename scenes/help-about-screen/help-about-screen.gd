# Author : Shaun Harbison
# MIT License : 2022
# 3.x: https://github.com/cyborg-kenneth/pathfinding-demo/tree/main
# 4.x Revisions : Poplava

extends Control

func _on_hide_button_pressed() -> void:
	queue_free()
