extends Node2D

@export var speed = 100
@export var radius = 10
@export var speed_increment = 12.5
@export var radius_increment = 1
@export var random_deflect = 0.5
@export var velocity = Vector2(5, 2)
@export var trail_color: Color
@onready var trail_fade = $trail_fade


var screen_size


func _ready():
	screen_size = get_viewport_rect().size
	trail_fade.default_color = trail_color
	

func _draw():
	draw_circle(Vector2.ZERO, radius, Color.WHITE)
	draw_circle(Vector2.ZERO, radius-2, Color.BLACK)
	

func _process(delta):
	# Update the circle's position
	position += velocity * speed * delta

	# Check for collisions with the walls
	if position.x < radius or position.x > get_viewport_rect().size.x - radius:
		velocity.x *= -1  # Reverse the horizontal velocity
		speed += speed_increment
		$note.play()

	if position.y < radius or position.y > get_viewport_rect().size.y - radius:
		velocity.y *= -1 # Reverse the vertical velocity
		speed += speed_increment
		$note.play()

	# Keep the circle inside the viewport
	position.x = clamp(position.x, radius, get_viewport_rect().size.x - radius)
	position.y = clamp(position.y, radius, get_viewport_rect().size.y - radius)
