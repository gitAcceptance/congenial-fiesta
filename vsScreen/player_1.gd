extends TextureFrame

var ryu = preload("res://charSelect/img1full.png")
var poe = preload("res://charSelect/img2full.png")
#var ling = preload("res://charSelect/img3full.png")
var feng = preload("res://charSelect/img4full.png")


func _ready():
	if Globals.get("current_state") == "Ryu":
		set_texture(ryu)
	elif Globals.get("current_state") == "Poe":
		set_texture(poe)
#	elif Globals.get("current_state") == "Ling":
#		set_texture(ling)
	elif Globals.get("current_state") == "Feng":
		set_texture(feng)
