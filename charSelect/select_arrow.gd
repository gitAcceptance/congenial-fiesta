extends Sprite

var init_location = Vector2(200, 500)
var init_state = "Ryu"
var current_location
var current_state

func _ready():
	current_location = init_location
	current_state = init_state
	self.set_process(true)
	
func _process(delta):
	if Input.is_action_pressed("ui_right"):
		
		if current_state == "Ryu":
			current_state = "Other"
			current_location = Vector2(820, 500)

	if Input.is_action_pressed("ui_left"):
		if current_state == "Other":
			current_state = "Ryu"
			current_location = Vector2(200, 500)
			
	if Input.is_action_pressed("ui_accept"):
		if current_state == "Ryu":
			get_tree().change_scene("res://vsScreen/vsScreen.tscn")
		elif current_state == "Other":
			get_tree().change_scene("res://vsScreen/vsScreen.tscn")
			
	
	self.set_pos(current_location)