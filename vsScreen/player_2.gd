extends TextureFrame

var sam = preload("res://charSelect/sam2.png")
var tanner = preload("res://charSelect/tanner2.png")

func _ready():
	if Globals.get("current_state_2") == "Ryu":
		set_texture(sam)
	elif Globals.get("current_state_2") == "Feng":
		set_texture(tanner)