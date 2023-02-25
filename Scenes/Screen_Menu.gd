extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass  # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_PlayButton_pressed():
	print("ici")
	get_tree().change_scene("res://Scenes/Node2D.tscn")


func _on_Help_Button_pressed():
	print("help")


func _on_Quit_Button_pressed():
	get_tree().quit()
# Replace with function body.
