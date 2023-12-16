extends Node2D

@export var ball_scene: PackedScene


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_pressed("escape"):
		get_tree().quit()


func on_wall_bounce():
	var ball = ball_scene.instantiate()
	var spawn_location = get_node("ball_by_code")
	
	ball.position = spawn_location.position
	ball.velocity = Vector2(randf_range(1, 3), randf_range(1, 3))
	
	add_child(ball)
