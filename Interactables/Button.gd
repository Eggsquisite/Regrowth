extends Button

var inRange = false


func _input(event):
	if event.is_action_pressed("interact") and inRange:
		print("interacting")
#		get_node(".").grab_click_focus()
		emit_signal("pressed")



func _on_Area2D_body_entered(body):
	print("entering")
	inRange = true




func _on_Area2D_body_exited(body):
	print("exited")
	inRange = false
