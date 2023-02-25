extends Area2D


func _on_Area2D_mouse_entered() -> void:
	print("coucou")
	Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)


func _on_Area2D_mouse_exited() -> void:
	print("bye")
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)
