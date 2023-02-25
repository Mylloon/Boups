extends Control


func _on_PlayButton_pressed():
	print("ici")
	get_tree().change_scene("res://Scenes/Node2D.tscn")


func _on_Help_Button_pressed():
	print("help")


func _on_Quit_Button_pressed():
	get_tree().quit()
# Replace with function body.
