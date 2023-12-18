extends CharacterBody2D

var speed: int = 400

func _process(delta):
	var direction = Vector2.RIGHT

	velocity = direction * speed

	# move and slide already uses delta time
	move_and_slide()
