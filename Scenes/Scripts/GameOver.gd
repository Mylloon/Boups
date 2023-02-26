extends Node2D
onready var hover_sound = $"Hover"


func _on_RestartButton_pressed() -> void:
	get_tree().change_scene("res://Scenes/Menu.tscn")


func _on_RestartButton_mouse_entered() -> void:
	hover_sound.play()
