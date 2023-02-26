extends Node2D

onready var me = $AnimatedSprite

onready var timer
var limit_random
var rng = RandomNumberGenerator.new()
export(Array, String) var animations = ["green", "orange", "red"]

# True if animation should change
var next = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
  rng.randomize()

  reset_timer()
  me.play(animations[0])


func reset_timer() -> void:
  timer = 0
  limit_random = rng.randi_range(2, 10)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta) -> void:
  timer += delta

  var max_frame = me.frames.get_frame_count(me.animation) - 1
  var current_anim_idx = animations.find(me.animation)
  if current_anim_idx >= animations.size() - 1:
    # Last animation reached
    check_next_animframe(max_frame, animations[0])
  else:
    check_next_animframe(max_frame, animations[current_anim_idx + 1])


# Jump to next animation at the end of the current one
func check_next_animframe(max_frame, next_animation) -> void:
  if me.frame == 0 and next:
    me.play(next_animation)
    next = false
    if next_animation == animations[0]:
      # Reset random for first animation
      reset_timer()
    return
  if max_frame == me.frame:
    # Last frame of animation reached
    next = true
    return
  if max_frame == -1 and timer >= limit_random:
    # No frame in animation, use time
    next = true
    return
