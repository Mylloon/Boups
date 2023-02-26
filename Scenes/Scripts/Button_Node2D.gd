extends Button

onready var villain = $"../../../Villain/AnimatedSprite"
onready var villain_animations = $"../../../Villain"

export(bool) var etat = false
const texture_pressed = preload("res://Assets/tres_button/hover-pressed.png")
const texture_released = preload("res://Assets/tres_button/normal.png")

var timer = 0


# Called every frame. '_delta' is the elapsed time since the previous frame.
func _process(delta) -> void:
	if etat:
		timer += delta
		if villain.animation == villain_animations.animations[-1]:
			assert(get_tree().change_scene("res://Scenes/gameover.tscn") == OK)
		if timer >= 7:  # fermer le dossier et enlever l'icone
			etat = false
			self.get_parent().get_parent().visible = false


func _on_Button_pressed() -> void:
	etat = !etat
	var new_stylebox_normal = self.get_stylebox("normal").duplicate()
	if etat:
		new_stylebox_normal.texture = texture_pressed
	else:
		new_stylebox_normal.texture = texture_released
	self.add_stylebox_override("normal", new_stylebox_normal)
