extends Node2D

@export var speed = 100
@export var radius = 8
@export var speed_increment = 1.5
@export var radius_increment = 1
@export var random_deflect = 0.5
@export var velocity = Vector2(5, 2)


var screen_size


func _ready():
	screen_size = get_viewport_rect().size
	

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
		print(speed)
		$note.play()

	if position.y < radius or position.y > get_viewport_rect().size.y - radius:
		velocity.y *= -1 # Reverse the vertical velocity
		speed += speed_increment
		print(speed)
		$note.play()

	# Keep the circle inside the viewport
	position.x = clamp(position.x, radius, get_viewport_rect().size.x - radius)
	position.y = clamp(position.y, radius, get_viewport_rect().size.y - radius)
