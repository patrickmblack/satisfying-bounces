extends CharacterBody2D
class_name Ball

@export var acceleration = 5
@export var speed = 350
@export var speed_inc = 10

@export var vel = Vector2(3,2)
@onready var collision_shape_2d = $CollisionShape2D
@onready var note = $note


var start_pos: Vector2


func _ready():
	velocity = vel

func _physics_process(delta):
	var collision = move_and_collide(velocity * speed * delta)
	if (collision):
		velocity = velocity.bounce(collision.get_normal())
		speed += speed_inc
		note.play()
	
