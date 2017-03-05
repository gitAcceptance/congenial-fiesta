extends TextureFrame

var sam = preload("res://charSelect/sam.jpg")
var tanner = preload("res://charSelect/tanner.jpg")

func _ready():
	if Globals.get("current_state") == "Ryu":
		set_texture(sam)
	elif Globals.get("current_state") == "Feng":
		set_texture(tanner)