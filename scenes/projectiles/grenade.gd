extends RigidBody2D

@export var speed: int = 700

func explode():
	$AnimationPlayer.play("Explosion")
