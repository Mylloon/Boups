extends Area2D


func _on_Area2D_mouse_entered() -> void:
	Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)


func _on_Area2D_mouse_exited() -> void:
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)
