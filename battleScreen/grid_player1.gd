
extends Control


class Piece:
	var first
	var second
	
	func _init(f, s):
		first = f
		second = s
		

class Block: 
	
	var color
	var isBreaker
	var pos
	
	func _init(c, isB, p):
		color = c
		isBreaker = isB
		pos = p
	

var block = preload("block.png")


var block_colors = [
	Color(1, 0.5, 0.5),
	Color(0.5, 1, 0.5),
	Color(0.5, 0.5, 1),
	Color(0.8, 0.4, 0.8),
	Color(0.8, 0.8, 0.4),
	Color(0.4, 0.8, 0.8),
	Color(0.7, 0.7, 0.7)]


var width = 0
var height = 0
var rotation = 0

var piece_active = false
var current_piece = null
var cells = {}

func piece_check_fit(v):
	if (cells.has(Vector2(current_piece.first.pos.x + v.x, current_piece.first.pos.y + v.y))):
		return false
	elif (cells.has(Vector2(current_piece.second.pos.x + v.x, current_piece.second.pos.y + v.y))):
		return false
	elif current_piece.first.pos.x + v.x < 0:
		return false
	elif current_piece.first.pos.y + v.y < 0:
		return false
	elif current_piece.first.pos.y + v.y > height - 1:
		return false
	elif current_piece.first.pos.x + v.x > width - 1:
		return false
	elif current_piece.second.pos.x + v.x < 0:
		return false
	elif current_piece.second.pos.y + v.y < 0:
		return false
	elif current_piece.second.pos.y + v.y > height - 1:
		return false
	elif current_piece.second.pos.x + v.x > width - 1:
		return false
	else:
		return true
	
func _input(ie):
	if (not piece_active):
		return
	if (!ie.is_pressed()):
		return

	if (ie.is_action("player1_move_left")):
		if (piece_check_fit(Vector2(-1, 0))):
			current_piece.first.pos.x -= 1
			current_piece.second.pos.x -= 1
			update()
	elif (ie.is_action("player1_move_right")):
		if (piece_check_fit(Vector2(1, 0))):
			current_piece.first.pos.x += 1
			current_piece.second.pos.x += 1
			update()
	elif (ie.is_action("player1_move_down")):
		piece_move_down()
	elif (ie.is_action("player1_rotate")):
		piece_rotate()
	

func piece_move_down():
	if (!piece_active):
		return
	if (piece_check_fit(Vector2(0, 1))):
		current_piece.first.pos.y += 1
		current_piece.second.pos.y += 1
		update()
		
	else:
		cells[current_piece.first.pos] = current_piece.first
		cells[current_piece.second.pos] = current_piece.second
		# TODO look for exploding blocks
		
		new_piece()

func piece_rotate():
	if rotation == 0:
		current_piece.second.pos = Vector2(current_piece.second.pos.x + 1, current_piece.second.pos.y - 1)
		update()
	elif rotation == 1:
		current_piece.second.pos = Vector2(current_piece.second.pos.x - 1, current_piece.second.pos.y - 1)
		update()
	elif rotation == 2:
		current_piece.second.pos = Vector2(current_piece.second.pos.x - 1, current_piece.second.pos.y + 1)
		update()
	else:
		current_piece.second.pos = Vector2(current_piece.second.pos.x + 1, current_piece.second.pos.y + 1)
		update()

func new_piece():
	current_piece = Piece.new(Block.new(block_colors[randi() % block_colors.size()], false, Vector2(3, -1)), Block.new(block_colors[randi() % block_colors.size()], false, Vector2(3, 0)))
	piece_active = true
	
	update()

func _draw():
	
	
	var sb = get_stylebox("bg", "Tree") # Use line edit bg
	draw_style_box(sb, Rect2(Vector2(), get_size()).grow(3))

	var bs = block.get_size()

	for cell in cells:
		if cells[cell].isBreaker == false:
			draw_texture_rect(block, Rect2(cell*bs, bs), false, cells[cell].color)

	if (piece_active):
		draw_texture_rect(block, Rect2(current_piece.first.pos*bs, bs), false, current_piece.first.color)
		draw_texture_rect(block, Rect2(current_piece.second.pos*bs, bs), false, current_piece.first.color)




func setup(w, h):
	width = w
	height = h
	#draw_texture_rect(block, Rect2(Vector2(0, 0), Vector2(10, 10)), false, block_colors[0])
	#draw_texture_rect(block, Rect2(Vector2(10, 20), Vector2(10, 10)), false, block_colors[1])
	set_size(Vector2(w, h)*block.get_size())
	new_piece()
	get_node("timer1").start()

func _ready():
	# set up
	#print("ready")
	set_process_input(true)
	setup(6, 13)
	

