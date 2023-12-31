extends ParentLevel

@export var inside_scene: PackedScene = preload("res://scenes/levels/inside.tscn")

func _on_gate_player_entered_gate(_body: Node2D):
	var tween = create_tween()
	tween.tween_property($Player, "speed", 0, 0.5)
	get_tree().change_scene_to_packed(inside_scene)

func _on_house_player_exited():
	var tween = get_tree().create_tween()
	tween.tween_property($Player/Camera2D, "zoom", Vector2(0.6, 0.6), 1).set_trans(Tween.TRANS_QUAD)

func _on_house_player_entered():
	var tween = get_tree().create_tween()
	# tween.tween_property($Player, "modulate:a", 0, 1).from(0.5) # access properties on a node with `:`
	tween.tween_property($Player/Camera2D, "zoom", Vector2(1, 1), 1)
