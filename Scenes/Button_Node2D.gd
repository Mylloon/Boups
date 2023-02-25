extends Button

onready var villain = $"../Villain/AnimatedSprite"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	match villain.get_frame():
		2:
			print("non")
		_:
			print("oui")
