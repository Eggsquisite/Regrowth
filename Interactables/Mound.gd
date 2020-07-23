extends Sprite

var interactable = true
export var plants : PoolStringArray

onready var mushroom = preload("res://Interactables/MushroomBig.tscn").instance()
onready var plant_list = [mushroom]

func _ready():
	add_to_group("interact")


func _on_Area2D_body_entered(body):
	if body.has_method("InRange") and interactable:
		body.InRange(true)
		$PlantPrompt.visible = true


func _on_Area2D_body_exited(body):
	if body.has_method("InRange"):
		body.InRange(false)
		$PlantPrompt.visible = false


func Interacting(value):
	$PlantPrompt.visible = !value
	$PlantList.visible = value


func Selected(value):
	var temp
	interactable = false
	if plants[value] != "":
		temp = load(plants[value]).instance()
		temp.initialize(global_position)
	
	get_tree().get_root().add_child(temp)
	get_tree().call_group("Player", "InteractFinished")
	queue_free()


