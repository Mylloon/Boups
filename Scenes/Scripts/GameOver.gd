extends Node2D


func _on_RestartButton_pressed() -> void:
	assert(get_tree().change_scene("res://Scenes/Menu.tscn") == OK)
