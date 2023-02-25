extends Button

onready var villain = $"../Villain/AnimatedSprite"
var etat 
var _texture1 = load("res://Assets//skin_assets/button_normal.png")
var _texture2 = load("res://Assets//skin_assets/button_pressed.png")


# Called when the node enters the scene tree for the first time.
func _ready():
	etat = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	match villain.get_frame():
		2:
			if(etat) : print("non")
			else: print("caché")
		_:
			if(etat) : print("oui")
			else: print("caché")
#	pass


func _on_Button_pressed():
	etat = !etat
	"""
	if(etat) :
		self.StyleBoxTexture.set_texture(_texture1) # reste appuyé
	else  :
		self.StyleBoxTexture.set_texture(_texture2) # pas appuyé
		
	"""
	"""	"""

