extends MenuButton

signal grow

func _ready():
	add_to_group("PlantSelect")


func _on_PlantSelect_pressed():
	print("hi")

