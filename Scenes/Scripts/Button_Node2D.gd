extends Button

onready var villain = $"../Villain/AnimatedSprite"
onready var villain_animations = $"../Villain".animations

var etat = false
const texture_pressed = preload("res://Assets/tres_button/hover-pressed.png")
const texture_released = preload("res://Assets/tres_button/normal.png")


# Called every frame. '_delta' is the elapsed time since the previous frame.
func _process(_delta) -> void:
	if etat:
		if villain.animation == villain_animations[-1]:
			assert(get_tree().change_scene("res://Scenes/GameOver.tscn") == OK)


func _on_Button_pressed() -> void:
	etat = !etat
	var new_stylebox_normal = self.get_stylebox("normal").duplicate()
	if etat:
		new_stylebox_normal.texture = texture_pressed
	else:
		new_stylebox_normal.texture = texture_released
	self.add_stylebox_override("normal", new_stylebox_normal)