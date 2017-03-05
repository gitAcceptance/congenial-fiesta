extends Sprite

var init_location = Vector2(130, 100)
var init_state = "Ryu"
var current_location
var current_state_2

func _ready():
	current_location = init_location
	current_state_2 = init_state
	self.set_process_input(true)
	
func _input(event):
	if event.is_action_pressed("player2_move_right"):
		
		if current_state_2 == "Ryu":
			current_state_2 = "Poe"
			current_location = Vector2(390, 100)
			
		elif current_state_2 == "Poe":
			current_state_2 = "Ling"
			current_location = Vector2(645, 100)
			
		elif current_state_2 == "Ling":
			current_state_2 = "Feng"
			current_location = Vector2(920, 100)

	if event.is_action_pressed("player2_move_left"):
		if current_state_2 == "Feng":
			current_state_2 = "Ling"
			current_location = Vector2(645, 100)
		elif current_state_2 == "Ling":
			current_state_2 = "Poe"
			current_location = Vector2(390, 100)
		elif current_state_2 == "Poe":
			current_state_2 = "Ryu"
			current_location = Vector2(130, 100)
			
	if Input.is_action_pressed("player2_accept"):
		if current_state_2 == "Ryu":
			get_tree().change_scene("res://vsScreen/vsScreen.tscn")
		elif current_state_2 == "Feng":
			get_tree().change_scene("res://vsScreen/vsScreen.tscn")
			
	
	self.set_pos(current_location)
	
	Globals.set("current_state_2", current_state_2)