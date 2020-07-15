extends Sprite

func _ready():
	add_to_group("interact")


func _on_Area2D_body_entered(body):
	if body.has_method("InRange"):
		body.InRange(true)
		$PlantSelect.visible = true
	


func _on_Area2D_body_exited(body):
	if body.has_method("InRange"):
		body.InRange(false)
		$PlantSelect.visible = false


func Interacting():
	print("interacting")
