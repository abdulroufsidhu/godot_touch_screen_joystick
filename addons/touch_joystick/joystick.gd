@tool
extends Node2D

signal direction

@export var base_color : Color:
	set(value):
		queue_redraw()
		base_color = value

@export var size: float = 32:
	set(value):
		queue_redraw()
		size = value

var _shall_process: bool = false
var knob_position: Vector2 = Vector2.ZERO

func _input(event: InputEvent) -> void:
	#if (event is InputEventMouseButton or event is  InputEventScreenTouch or event is InputEventScreenDrag):
	#if (event is InputEventMouseButton):
		#print(event)
		#var mouse: InputEventMouseButton = event as InputEventMouseButton
		#_process_input(event, mouse.position)
	
	if (event is  InputEventScreenTouch):	
		var touch: InputEventScreenTouch = event as InputEventScreenTouch
		if (((touch.position - position)/size).length() < 1):
			_shall_process = true
		_process_input(event, touch.position)
	
	if (event is InputEventScreenDrag):
		var drag: InputEventScreenDrag = event as InputEventScreenDrag
		_process_input(event, drag.position)
	#if (event is InputEventScreenTouch):
	
func _process_input(event: InputEvent, pos: Vector2) -> void:
	if (not _shall_process): return
	
	var knob_pos = pos - position
	if (event.is_released() and (event is InputEventScreenTouch and not event.is_pressed())):
		knob_position = Vector2.ZERO
		direction.emit(Vector2.ZERO)
		queue_redraw()
		_shall_process = false
		return;
	
	var _direction_vector:Vector2 = (knob_pos/size).normalized()
	knob_position = knob_pos.limit_length(size)
	direction.emit(_direction_vector)
	queue_redraw()

func _draw() -> void:
	var center = Vector2(0,0)
	var radius = size
	var color = Color(base_color, 0.25)
	draw_circle(center, radius, color, false, 2, true)
	draw_circle(center, radius, color, true, -1, true)
	draw_circle(knob_position, radius/4, color, true, -1, true)
	
