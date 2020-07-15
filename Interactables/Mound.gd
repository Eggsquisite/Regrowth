extends Sprite

var interactable = true
export (NodePath) var plant_0
export (NodePath) var plant_1
export (NodePath) var plant_2
var plant_list = []

func _ready():
	add_to_group("interact")
	connect("plantMenu", $PlantSelect, "_open_PlantMenu")
	
	for i in range(3):
		add_child(plant_0)


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

