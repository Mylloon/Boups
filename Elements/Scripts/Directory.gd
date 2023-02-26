extends Area2D

onready var screen = $"../Screen"
onready var sprite = $"../Sprite"


func _on_Area2D_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
  if event is InputEventMouseButton:
    event = event as InputEventMouseButton
    if event.pressed and event.button_index == BUTTON_LEFT:
      screen.visible = true
      sprite.modulate = Color(0.66, 0.51, 0.85)  # shade
