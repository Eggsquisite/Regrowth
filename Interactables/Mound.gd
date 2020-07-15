extends Sprite

#signal plantMenu

func _ready():
	add_to_group("interact")
	connect("plantMenu", $PlantSelect, "_open_PlantMenu")


func _on_Area2D_body_entered(body):
	if body.has_method("InRange"):
		body.InRange(true)
#		SetVisibility(true)
		$PlantPrompt.visible = true


func _on_Area2D_body_exited(body):
	if body.has_method("InRange"):
		body.InRange(false)
#		SetVisibility(false)
		$PlantPrompt.visible = false


func SetVisibility(value):
	$PlantPrompt.visible = value
	$PlantList.visible = value


func Interacting(value):
#	emit_signal("plantMenu")
	$PlantPrompt.visible = !value
	$PlantList.visible = value


func Selected(value):
	SetVisibility(false)
	print("done")
