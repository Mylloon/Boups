extends Node

onready var villain = $"Villain/AnimatedSprite"
onready var villain_animations = $"Villain"
onready var mainMusic = $"MainMusic"
onready var eyeMusic = $"EyeMusic"
onready var alert = $"Alert"
onready var directory = $"Directory"

var rng = RandomNumberGenerator.new()

const texture_file = preload("res://Assets/dossier/1.png")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	rng.randomize()
	var nbDossier = rng.randi_range(0, 3)
	for i in range(nbDossier):
		var dossier = directory.duplicate()
		var icon = dossier.get_node("Sprite")
		var window = dossier.get_node("Screen")
		var button_window = window.get_node("Button2")

		# Une chance sur 2 d'avoir une icône
		if rng.randi_range(0, 1) == 0:
			# Text (icon)
			var name_icon = dossier.get_node("Label")
			name_icon.text = "Fichier"
			# Texture (icon)
			var scale_icon = 0.35
			icon.scale = Vector2(scale_icon, scale_icon)
			icon.texture = texture_file
			# Background (window)
			window.get_node("Window").visible = false
			window.get_node("Window2").visible = true
			# Change button visibility
			button_window.visible = false

		button_window.focus_mode = Button.FOCUS_NONE
		dossier.position = Vector2(dossier.position.x, dossier.position.y + 150 * (i + 1))
		dossier.set_z_index(dossier.get_z_index() + 10 * (i + 1))
		add_child(dossier)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta) -> void:
	if villain.animation == villain_animations.animations[-1]:
		mainMusic.set_volume_db(-80)
		eyeMusic.set_volume_db(0)
		if alert.is_playing():
			alert.stop()
	elif villain.animation == villain_animations.animations[1]:
		if !alert.is_playing():
			alert.play()
	else:
		mainMusic.set_volume_db(0)
		eyeMusic.set_volume_db(-80)

	var end = true
	for i in self.get_children():
		if "Directory" in i.name:
			if i.visible:
				end = false

	if end:
		mainMusic.set_volume_db(-80)
		eyeMusic.set_volume_db(-80)
		assert(get_tree().change_scene("res://Scenes/victory.tscn") == OK)
