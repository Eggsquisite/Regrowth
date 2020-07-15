extends Control


func _ready():
	add_to_group("PlantList")


func _on_Button_pressed(ID):
	print("Plant Index: " + str(ID))
	get_tree().call_group("interact", "Selected", ID)
