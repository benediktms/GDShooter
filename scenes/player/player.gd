extends CharacterBody2D

@export var speed: int = 500

var can_fire_laser: bool = true
var can_throw_gernade: bool = true

signal laser(pos: Vector2, dir: Vector2)
signal grenade(pos: Vector2, dir: Vector2)

func _process(_delta):
	var direction = Input.get_vector('left', 'right', 'up', 'down')
	var markers: Array[Node] = $ProjectileStartPositions.get_children()
	var forward_vector = (get_global_mouse_position() - global_position).normalized()

	velocity = direction * speed
	move_and_slide()
	look_at(get_global_mouse_position())

	if Input.is_action_pressed('primary action') && can_fire_laser:
		can_fire_laser = false
		var selected_marker = markers[randi() % markers.size()] as Node
		laser.emit(selected_marker.global_position, forward_vector)
		$LaserTimer.start()

	if Input.is_action_pressed('secondary action') && can_throw_gernade:
		can_throw_gernade = false
		var selected_marker = markers[0] as Node
		grenade.emit(selected_marker.global_position, forward_vector)
		$GrenadeTimer.start()


func _on_laser_timer_timeout():
	can_fire_laser = true


func _on_granade_timer_timeout():
	can_throw_gernade = true
