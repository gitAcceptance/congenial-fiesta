extends TextureFrame

var sam = preload("res://charSelect/sam2.png")
var tanner = preload("res://charSelect/tanner2.png")

func _ready():
	if Globals.get("current_state") == "Ryu":
		set_texture(sam)
	elif Globals.get("current_state") == "Feng":
		set_texture(tanner)
