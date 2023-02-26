extends Control
onready var hover_sound = $"Hover"

func _on_PlayButton_pressed() -> void:
  assert(get_tree().change_scene("res://Scenes/DesktopScreen.tscn") == OK)


func _on_Help_Button_pressed() -> void:
  print("help me")


func _on_Quit_Button_pressed() -> void:
  get_tree().quit()



func _on_PlayButton_mouse_entered() -> void:
  hover_sound.play()

func _on_Quit_Button_mouse_entered() -> void:
  hover_sound.play()


func _on_Help_Button_mouse_entered() -> void:
  hover_sound.play()
