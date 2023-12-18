extends Node2D

var laser_scene: PackedScene = preload("res://scenes/projectiles/laser.tscn")
var grenade_scene: PackedScene = preload("res://scenes/projectiles/grenade.tscn")

func _on_gate_player_entered_gate(body: Node2D):
	print("player has entered gate")
	print(body)

func _on_player_grenade(pos: Vector2, dir: Vector2):
	var grenade = grenade_scene.instantiate() as RigidBody2D
	grenade.position = pos
	grenade.linear_velocity = dir * grenade.speed
	$Projectiles.add_child(grenade)

func _on_player_laser(pos: Vector2):
	var laser = laser_scene.instantiate() as Area2D
	laser.position = pos
	$Projectiles.add_child(laser)
