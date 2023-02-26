extends Node

onready var villain = $"Villain/AnimatedSprite"
onready var villain_animations = $"Villain"
onready var mainMusic = $"MainMusic"
onready var eyeMusic = $"EyeMusic"
onready var alert = $"Alert"

var rng = RandomNumberGenerator.new()


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	rng.randomize()
	var nbDossier = rng.randi_range(0, 3)
	for i in range(nbDossier):
		var dossier = get_child(2).duplicate()
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
