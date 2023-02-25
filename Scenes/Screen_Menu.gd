extends Control


func _on_PlayButton_pressed():
	get_tree().change_scene("res://Scenes/Node2D.tscn")


func _on_Help_Button_pressed():
	print("help me")


func _on_Quit_Button_pressed():
	get_tree().quit()
