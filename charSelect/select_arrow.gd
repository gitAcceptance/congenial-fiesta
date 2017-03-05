extends Sprite

var init_location = Vector2(130, 550)
var init_state = "Ryu"
var current_location
var current_state

func _ready():
	current_location = init_location
	current_state = init_state
	self.set_process_input(true)
	
func _input(event):
	if event.is_action_pressed("ui_right"):
		
		if current_state == "Ryu":
			current_state = "Poe"
			current_location = Vector2(390, 550)
			
		elif current_state == "Poe":
			current_state = "Ling"
			current_location = Vector2(645, 550)
			
		elif current_state == "Ling":
			current_state = "Feng"
			current_location = Vector2(920, 550)

	if event.is_action_pressed("ui_left"):
		if current_state == "Feng":
			current_state = "Ling"
			current_location = Vector2(645, 550)
		elif current_state == "Ling":
			current_state = "Poe"
			current_location = Vector2(390, 550)
		elif current_state == "Poe":
			current_state = "Ryu"
			current_location = Vector2(130, 550)
			
	if Input.is_action_pressed("ui_accept"):
		if current_state == "Ryu":
			get_tree().change_scene("res://vsScreen/vsScreen.tscn")
		elif current_state == "Feng":
			get_tree().change_scene("res://vsScreen/vsScreen.tscn")
			
	
	self.set_pos(current_location)
	
	Globals.set("current_state", current_state)


