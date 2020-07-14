extends Sprite



func _on_Area2D_body_entered(body):
	if body.has_method("InRange"):
		body.InRange(true)


func _on_Area2D_body_exited(body):
	if body.has_method("InRange"):
		body.InRange(false)
