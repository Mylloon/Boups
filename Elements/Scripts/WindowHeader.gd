extends Area2D

var is_dragging = false
var grabbed_offset = Vector2()

onready var window = $"../.."
onready var folder_icon = $"../../../Sprite"


func drag_change_state():
	is_dragging = !is_dragging
	grabbed_offset = window.get_position() - get_global_mouse_position()


func _process(_delta) -> void:
	if is_dragging:
		var new_pos = get_global_mouse_position() + grabbed_offset
		if new_pos.x > 150:
			window.set_position(new_pos)
		else:
			drag_change_state()


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
			window.visible = false
			folder_icon.modulate = Color(1, 1, 1)  # reset shade
			var progress_screen = window.get_node("Window2")
			if progress_screen.visible:
				progress_screen.stop()
				window.get_node("Button2").etat = false
