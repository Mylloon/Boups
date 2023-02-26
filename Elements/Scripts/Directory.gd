extends Area2D

onready var screen = $"../Screen"


func _on_Area2D_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton:
		event = event as InputEventMouseButton
		if event.pressed and event.button_index == BUTTON_LEFT:
			screen.visible = true
