extends Control

onready var acceptButton = $CenterContainer/TextureButton

func _input(event):
	if event.is_action_pressed("ui_accept"):
		_on_PlantButton_accept()


func _on_PlantButton_accept():
#	print("accept")
	pass




func _on_TextureButton_pressed():
	pass # Replace with function body.
