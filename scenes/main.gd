# Author : Shaun Harbison
# MIT License : 2022
# 3.x: https://github.com/cyborg-kenneth/pathfinding-demo/tree/main
# 4.x Revisions : Poplava

extends Control

func _on_show_help_about_button_pressed() -> void:
	var helpAboutScreen = load("res://scenes/help-about-screen/help-about-screen.tscn").instantiate()
	%Hud.add_child(helpAboutScreen)
