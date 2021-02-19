extends Control

var testing = true

onready var psd: PopupShaderDialog = get_child(0)

func _ready():
	psd.open("Test Multiple Lines", "Amet in quia et magni maiores assumenda odio iste. Temporibus earum sit dolore voluptatibus cumque est qui. Sequi rem voluptas voluptatem corporis rerum asperiores repellendus.\nInventore quia ipsam culpa blanditiis qui sunt ut.\nReprehenderit et voluptates omnis aliquid provident facere cupiditate. Impedit cumque qui rem")


func _on_PopupShaderDialog_closed():
	if testing:
		psd.open("Close Soon", "Shrinked content", 2.0)
		testing = false
