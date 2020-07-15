extends Sprite

var interactable = true

func _ready():
	add_to_group("interact")
	connect("plantMenu", $PlantSelect, "_open_PlantMenu")


func _on_Area2D_body_entered(body):
	if body.has_method("InRange") and interactable:
		body.InRange(true)
		$PlantPrompt.visible = true


func _on_Area2D_body_exited(body):
	if body.has_method("InRange"):
		body.InRange(false)
		$PlantPrompt.visible = false


func SetVisibility(value):
	$PlantPrompt.visible = value
	$PlantList.visible = value


func Interacting(value):
	$PlantPrompt.visible = !value
	$PlantList.visible = value


func Selected(value):
#	interactable = false
	SetVisibility(false)
	get_tree().call_group("Player", "InteractFinished")

