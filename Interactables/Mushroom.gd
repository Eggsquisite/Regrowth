extends AnimatedSprite

const OFFSET = 12


func _ready():
	$AnimationPlayer.play("mushroom_boost")
	$AnimationPlayer.play("mushroom_boost")


func initialize(pos_vector):
	var tmp = Vector2(pos_vector.x, pos_vector.y - OFFSET)
	global_position = tmp
	set_as_toplevel(true)


func _on_Area2D_body_entered(body):
	$AnimationPlayer.play("mushroom_boost")
	if body.has_method("Boost"):
		body.Boost()
