extends PopupDialog

class_name PopupShaderDialog

signal closed

const MANUAL_TIMEOUT = 0.0 # Need to call close()
const DEFAULT_TIMEOUT = 3.0

var y_reset_size : float

onready var title_node = $Margin/HBox/Title
onready var content_node = $Margin/HBox/Content

func open(title := "Title", content := "The content", timeout := DEFAULT_TIMEOUT):
	popup_centered()
	# Store panel size for when we reset it on close
	y_reset_size = rect_size.y
	title_node.text = title
	content_node.text = content
	# Wait for panel to be resized (expanded vertically)
	yield(get_tree(), "idle_frame")
	# Resize the panel to match the content
	rect_size = get_child(0).rect_size
	# Adjust to center of screen
	rect_position.y -= (rect_size.y - y_reset_size) / 2
	if timeout > 0.0:
		$Timer.start(timeout)


func close():
	hide()
	title_node.text = ""
	content_node.text = ""
	get_child(0).rect_size.y = y_reset_size
	rect_size.y = y_reset_size
	emit_signal("closed")


func _on_Timer_timeout():
	close()
