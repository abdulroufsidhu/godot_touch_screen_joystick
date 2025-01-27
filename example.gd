extends Node2D

var _direction: Vector2 = Vector2.ZERO

var _using_signal: bool = false

func _process(delta: float) -> void:
	_move(_direction)

func _input(event: InputEvent) -> void:
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	print("_input", direction, _direction)
		
	if (not _using_signal): 
		_direction = direction
	if (direction != Vector2.ZERO):
		_using_signal = false

func _move(direction: Vector2) -> void:
	if (direction == Vector2.ZERO):
		return
	print("moving", direction)
	$CharacterBody2D.velocity = direction * 300
	$CharacterBody2D.move_and_slide()

func _on_touch_screen_joystick_direction(direction: Vector2) -> void:
	_using_signal = true
	print("_on_touch_screen_joystick_direction", direction)
	_direction = direction
