extends Control
onready var hover_sound = $"Hover"
onready var help = $"../Help"


func _on_PlayButton_pressed() -> void:
	get_tree().change_scene("res://Scenes/DesktopScreen.tscn")


func _on_Help_Button_pressed() -> void:
	help.visible = true


func _on_Quit_Button_pressed() -> void:
	get_tree().quit()


func _on_PlayButton_mouse_entered() -> void:
	hover_sound.play()


func _on_Quit_Button_mouse_entered() -> void:
	hover_sound.play()


func _on_Help_Button_mouse_entered() -> void:
	hover_sound.play()
