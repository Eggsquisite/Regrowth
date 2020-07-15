extends TextureButton

func _ready():
	connect("pressed", self, "_on_ButtonPress_select")


func _on_ButtonPress_select():
	print("pressed " + name)
	get_tree().call_group("PlantList", "_on_Button_pressed", name.to_int())
