@tool

extends Node2D

var markers = []
@export var number_of_markers = 2
var screen_size
@export var pos: Vector2
var marker


# Called when the node enters the scene tree for the first time.
func _ready():
	pos = Vector2(69, 150)
	screen_size = get_viewport_rect().size
	marker = Marker2D.new()
	add_child(marker)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	marker.position = pos
