extends MenuButton

signal grow

func _ready():
	get_popup().connect("id_pressed", self, "_open_PlantMenu")


func _open_PlantMenu():
	print("hi")

