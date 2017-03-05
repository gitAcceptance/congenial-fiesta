extends TextureFrame

var sam = preload("res://charSelect/sam.jpg")
var tanner = preload("res://charSelect/tanner.jpg")

func _ready():
	if Globals.get("current_state") == "Ryu":
		set_texture(tanner)
	elif Globals.get("current_state") == "Other":
		set_texture(sam)