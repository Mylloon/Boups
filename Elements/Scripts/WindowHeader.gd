extends Area2D

var is_dragging = false
var grabbed_offset = Vector2()

onready var window = $"../.."


func drag_change_state():
	is_dragging = !is_dragging
	grabbed_offset = window.get_position() - get_global_mouse_position()


func _process(_delta) -> void:
	if is_dragging:
		window.set_position(get_global_mouse_position() + grabbed_offset)


func _on_Area2D_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton:
		event = event as InputEventMouseButton
		if event.pressed and event.button_index == BUTTON_LEFT:
			drag_change_state()
		elif event.button_index == BUTTON_LEFT and !event.pressed:
			drag_change_state()


func _on_Area2D2_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton:
		event = event as InputEventMouseButton
		if event.pressed and event.button_index == BUTTON_LEFT:
			drag_change_state()
			window.visible = !window.visible
