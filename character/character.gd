# Author : Shaun Harbison
# MIT License : 2022
# 3.x: https://github.com/cyborg-kenneth/pathfinding-demo/tree/main
# 4.x Revisions : Poplava

extends CharacterBody2D

@onready var _navAgent = %NavigationAgent2D
@export var _speed : float = 100.0

var _pathAttempts = 0
var _maxPathAttempts = 3
var _defaultRoamDistance = 100
var _roamDistance = _defaultRoamDistance
var _targetPosition : Vector2
var _tempPosition : Vector2
var _nextPosition : Vector2 
var _lastPosition : Vector2 
var _starSpinAngle : float = 0

func _ready() -> void:
	ToggleMovement(false)
	_targetPosition = global_position
	_nextPosition = global_position

func ToggleMovement(value):
	set_physics_process(value)

func _physics_process(delta : float) -> void:
	_nextPosition = _navAgent.get_next_path_position()
	var newVelocity = global_position.direction_to(_nextPosition) * _speed
	_navAgent.set_velocity(newVelocity)
	_starSpinAngle += delta * 2.0 # Spin the star

func SetNavTarget(targetPosition : Vector2):
	_targetPosition = targetPosition
	SetTempPosition(targetPosition)
	ToggleMovement(true)

func SetTempPosition(targetPosition : Vector2):
	_tempPosition = targetPosition
	_navAgent.target_position = _tempPosition
	%ProgressTimer.start()

func CharacterVelocityComputed(safeVelocity : Vector2) -> void:
	velocity = safeVelocity
	
	if !_navAgent.is_target_reached():
		move_and_slide()
	else:
		# We completed all steps in current navigation.
		# Stop character.
		%ProgressTimer.stop()
		global_position = NavigationServer2D.map_get_closest_point(_navAgent.get_navigation_map(), global_position)
		
		# Did we reach our original destination
		if _targetPosition != _tempPosition:
			# No, try again from new temp position
			SetTempPosition(_targetPosition)

# When stuck, move to random location so we
# can try pathing to our original destination
# from the new location. This generally will help
# us work around blockages.
func CheckProgress():
	if _lastPosition == _nextPosition:
		_pathAttempts += 1
		if _pathAttempts >= _maxPathAttempts:
			if _tempPosition != _targetPosition:
				SetTempPosition(_targetPosition)
				
			var newTempPosition = GetRandomRoamDestination()
			SetTempPosition(newTempPosition)
			_roamDistance += 50
	else:
		_roamDistance = _defaultRoamDistance
		_pathAttempts = 0
		_lastPosition = _nextPosition

func GetRandomRoamDestination():
	var random_angle = randf_range(0, 2 * PI) # Random angle in radians
	var direction = Vector2(cos(random_angle), sin(random_angle)) # Direction vector
	return global_position + direction * _roamDistance 

func _on_navigation_agent_2d_velocity_computed(safe_velocity: Vector2) -> void:
	CharacterVelocityComputed(safe_velocity)

func _on_progress_timer_timeout() -> void:
	CheckProgress()
