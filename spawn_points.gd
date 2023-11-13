@tool
extends Node2D

var marker_pos = []
var markers = []
@export var number_of_markers = 2

var screen_size
@export var start_pos: Vector2
var pos: Vector2
@export var pos_increment = 100
var marker
var num_markers
var i



# Called when the node enters the scene tree for the first time.
func _ready():
	start_pos = Vector2(75, 360)
	update_markers()
	i = 0
	pass
	
func update_markers():
	
	marker_pos = []
	markers = []
	screen_size = get_viewport_rect().size
	
	
	
	for i in number_of_markers:
		pos = Vector2(start_pos.x + (i * pos_increment), start_pos.y)
		marker_pos.push_back(pos)
		marker = Marker2D.new()
		marker.position = pos
		add_child(marker)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Engine.is_editor_hint():
		if i == 0:
			update_markers()
			i += 1
