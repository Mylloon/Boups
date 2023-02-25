extends Button

onready var villain = $"../Villain/AnimatedSprite"

var etat
var texture_pressed = preload("res://Assets/skin_assets/button_normal.png")
var texture_released = preload("res://Assets/skin_assets/button_pressed.png")


# Called when the node enters the scene tree for the first time.
func _ready():
	etat = false
	pass  # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	match villain.get_frame():
		2:
			if etat:
				print("non")
			else:
				print("caché")
		_:
			if etat:
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
