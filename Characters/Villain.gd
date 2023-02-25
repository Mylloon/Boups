extends Node2D

onready var me = $AnimatedSprite

onready var timer
var limit_random
var rng = RandomNumberGenerator.new()
onready var button = $"../Button/"

# True if animation should change
var next = false


# Called when the node enters the scene tree for the first time.
func _ready():
	timer = 0
	rng.randomize()
	limit_random = rng.randi_range(2, 10)
	me.play("orange")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timer += delta

	var animations = ["orange", "red"]

	var max_frame = me.frames.get_frame_count(me.animation) - 1
	var current_anim_idx = animations.find(me.animation)
	if current_anim_idx >= animations.size() - 1:
		# Last animation reached
		check_next_animframe(me, max_frame, animations[0])
	else:
		check_next_animframe(me, max_frame, animations[current_anim_idx + 1])


# Jump to next animation at the end of the current one
func check_next_animframe(me, max_frame, next_animation):
	if me.frame == 0 and next:
		me.play(next_animation)
		next = false
	if max_frame == me.frame:
		# Last frame of animation reached
		next = true
