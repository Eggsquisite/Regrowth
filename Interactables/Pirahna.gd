extends AnimatedSprite

var OFFSET = 25

func _ready():
#	$AnimationPlayer.play("mushroom_boost")
#	set_as_toplevel(true)
	pass


func initialize(pos_vector):
	var tmp = Vector2(pos_vector.x, pos_vector.y - OFFSET)
	global_position = tmp
	set_as_toplevel(true)




