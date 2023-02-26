extends Node

onready var villain = $"Villain/AnimatedSprite"
onready var villain_animations = $"Villain"
onready var mainMusic = $"MainMusic"
onready var eyeMusic = $"EyeMusic"
onready var alert = $"Alert"
onready var directory = $"Directory"
onready var terminal = $"Terminal"

var rng = RandomNumberGenerator.new()

const texture_file = preload("res://Assets/dossier/1.png")
const texture_terminal = preload("res://Assets/dossier/2.png")  #à modifier


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var icon = terminal.get_node("Sprite")
	var window = terminal.get_node("Screen")
	var button_window = window.get_node("Button2")
	var name_term = terminal.get_node("Label")
	var scale_icon = 0.35

	rng.randomize()
	var nbDossier = rng.randi_range(4, 10)
	for i in range(nbDossier):
		var dossier = directory.duplicate()

		# Une chance sur 2 d'avoir une icône
		if rng.randi_range(0, 1) == 0:
			# Text (icon)
			icon = directory.get_node("Sprite")
			window = directory.get_node("Screen")
			button_window = window.get_node("Button2")
			var name_icon = directory.get_node("Label")
			name_icon.text = "Fichier"
			# Texture (icon)
			icon.scale = Vector2(scale_icon, scale_icon)
			icon.texture = texture_file
			# Background (window)
			window.get_node("Window").visible = false
			window.get_node("Window2").visible = true
			window.get_node("Window3").visible = false
			# Change button visibility
			button_window.visible = false

		var posY = i % 4
		var posX = i / 4
		if posX == 0:
			posY += 1
		button_window.focus_mode = Button.FOCUS_NONE
		dossier.position = Vector2(
			dossier.position.x + (150 * posX), dossier.position.y + 150 * (posY)
		)
		dossier.set_z_index(dossier.get_z_index() + 10 * (i + 1))
		add_child(dossier)

	icon = terminal.get_node("Sprite")
	window = terminal.get_node("Screen")
	name_term.text = "Terminal"
	scale_icon = 0.05
	icon.scale = Vector2(scale_icon, scale_icon)
	icon.texture = texture_terminal
	# Background (window)
	window.get_node("Window").visible = false
	window.get_node("Window2").visible = false
	window.get_node("Window3").visible = true
	# Change button visibility
	button_window.visible = false
	button_window.focus_mode = Button.FOCUS_NONE


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
