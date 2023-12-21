extends Area2D

@export var speed: int = 10000

var direction: Vector2 = Vector2.UP

func _process(delta):
	position += direction * speed * delta
	var timer = $DespawnTimer

	if timer.time_left == 0:
		queue_free()

func _on_body_entered(body):
	if "hit" in body:
		body.hit()

	queue_free()
