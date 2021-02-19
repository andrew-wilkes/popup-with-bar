extends PopupDialog

class_name PopupShaderDialog

signal closed

var y_size

func open(title := "Title", content := "The content", timeout := 3.0):
	popup_centered()
	# Store this size for when we reset it on close
	y_size = rect_size.y
	$Margin/HBox/Title.text = title
	$Margin/HBox/Content.text = content
	# Wait for panel to be resized
	yield(get_tree(), "idle_frame")
	# Resize the panel to match the content
	rect_size = get_child(0).rect_size
	# Adjust to center of screen
	rect_position.y -= (rect_size.y - y_size) / 2
	$Timer.start(timeout)


func close():
	hide()
	$Margin/HBox/Title.text = ""
	$Margin/HBox/Content.text = ""
	get_child(0).rect_size.y = y_size
	rect_size.y = y_size
	emit_signal("closed")


func _on_Timer_timeout():
	close()
