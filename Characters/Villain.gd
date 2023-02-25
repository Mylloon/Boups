extends Node2D

onready var me = $AnimatedSprite

onready var timer
var limit_random
var rng = RandomNumberGenerator.new()
onready var button = $"../Button/"


# Called when the node enters the scene tree for the first time.
func _ready():
  timer = 0
  rng.randomize()
  limit_random = rng.randi_range(2, 10)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
  timer += delta
  match me.get_frame():
    0:
      # Vert
      if timer >= limit_random:
        timer = 0
        limit_random = rng.randi_range(2, 10)
        me.set_frame(1)
    1:
      # Orange
      if timer >= .5:
        timer = 0
        me.set_frame(2)
    2:
      # Rouge
      if timer >= 2:
        timer = 0
        me.set_frame(0)
    _:
      print("Not handled frame")
