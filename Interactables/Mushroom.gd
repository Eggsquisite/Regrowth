extends AnimatedSprite


func _ready():
	$AnimationPlayer.play("mushroom_boost")


func _on_Area2D_body_entered(body):
	$AnimationPlayer.play("mushroom_boost")
	if body.has_method("Boost"):
		body.Boost()
