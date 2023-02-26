extends Button

onready var villain = $"../../../../Villain/AnimatedSprite"
onready var villain_animations = $"../../../../Villain"

var etat = false
var remplissage = 0
const texture_pressed = preload("res://Assets/tres_button/hover-pressed.png")
const texture_released = preload("res://Assets/tres_button/normal.png")


# Called every frame. '_delta' is the elapsed time since the previous frame.
func _process(_delta) -> void:
	if etat:
		if villain.animation == villain_animations.animations[-1]:
			assert(get_tree().change_scene("res://Scenes/gameover.tscn") == OK)
		if remplissage == 60 * 10:  # fermer le dossier et enlever l'icone
			etat = false
			self.get_parent().get_parent().visible = false
		else:
			remplissage += 1
			print(remplissage)


func _on_Button_pressed() -> void:
	etat = !etat
	var new_stylebox_normal = self.get_stylebox("normal").duplicate()
	if etat:
		new_stylebox_normal.texture = texture_pressed
	else:
		new_stylebox_normal.texture = texture_released
	self.add_stylebox_override("normal", new_stylebox_normal)
