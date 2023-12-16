extends Node2D

@export var speed = 100
@export var radius = 10
@export var speed_increment = 12.5
@export var radius_increment = 1
@export var random_deflect = 0.5
@export var velocity = Vector2(5, 2)
@export var trail_color: Color
@onready var trail_fade = $trail_fade

var random_color: Color
var random_color_fade: Color

signal wall_bounce


var screen_size


func _ready():
	var random_hue = randf()
	random_color = Color.from_hsv(random_hue,1.0,1.0,1.0)
	random_color_fade = Color.from_hsv(random_hue,1.0,1.0,0.0)
	
	screen_size = get_viewport_rect().size
	#trail_fade.default_color = random_color
	
	var trail_gradient = Gradient.new()
	
	trail_gradient.add_point(0.0, random_color)
	trail_gradient.add_point(0.999999, random_color_fade)
	
	trail_fade.gradient = trail_gradient

func _draw():
	draw_circle(Vector2.ZERO, radius, Color.WHITE)
	draw_circle(Vector2.ZERO, radius-3, random_color)
	

func _process(delta):
	# Update the circle's position
	position += velocity * speed * delta

	# Check for collisions with the walls
	if position.x < radius or position.x > get_viewport_rect().size.x - radius:
		velocity.x *= -1  # Reverse the horizontal velocity
		speed += speed_increment
		emit_signal("wall_bounce")
		print("bounce")
		$note.play()

	if position.y < radius or position.y > get_viewport_rect().size.y - radius:
		velocity.y *= -1 # Reverse the vertical velocity
		speed += speed_increment
		emit_signal("wall_bounce")
		print("bounce")
		$note.play()

	# Keep the circle inside the viewport
	position.x = clamp(position.x, radius, get_viewport_rect().size.x - radius)
	position.y = clamp(position.y, radius, get_viewport_rect().size.y - radius)

