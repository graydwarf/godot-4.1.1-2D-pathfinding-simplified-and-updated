# Author : Shaun Harbison
# MIT License : 2022
# 3.x: https://github.com/cyborg-kenneth/pathfinding-demo/tree/main
# 4.x Revisions : Poplava

extends Control

var main
var characters = []
var obstacles = []

@onready var _characterContainer = %CharacterContainer
@onready var _star = %Star

func CreateCharacter() -> void:
	var character = load("res://character/character.tscn").instantiate()
	_characterContainer.add_child(character)
	character.global_position = get_global_mouse_position()

func PlaceNavTarget() -> void:
	for character in _characterContainer.get_children():
		character.SetNavTarget(get_global_mouse_position())
		ShowStar()
	
func ShowStar():
	if _star:
		_star.global_position = get_global_mouse_position()

func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				PlaceNavTarget()
				%FollowMouseTimer.start()
			else:
				_star.visible = true
				%FollowMouseTimer.stop()
		if event.button_index == MOUSE_BUTTON_RIGHT:
			if event.pressed:
				call_deferred("CreateCharacter")

func _on_follow_mouse_timer_timeout() -> void:
	_star.visible = false
	PlaceNavTarget()
