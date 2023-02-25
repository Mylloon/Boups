extends Button

onready var villain = $"../Villain/AnimatedSprite"

var etat
const texture_pressed = preload("res://Assets/skin_assets/button_normal.png")
const texture_released = preload("res://Assets/skin_assets/button_pressed.png")


# Called every frame. '_delta' is the elapsed time since the previous frame.
func _process(_delta):
	if etat:
		match villain.get_frame():
			2:
				print("non")
			_:
				print("oui")
	else:
		print("caché")


func _on_Button_pressed():
	etat = !etat
	var new_stylebox_normal = self.get_stylebox("normal").duplicate()
	if etat:
		new_stylebox_normal.texture = texture_pressed
	else:
		new_stylebox_normal.texture = texture_released
	self.add_stylebox_override("normal", new_stylebox_normal)
