extends Button

onready var window = $".."


func _on_Back_button_pressed() -> void:
	window.visible = false
