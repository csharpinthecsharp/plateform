extends Node2D


func _physics_process(delta: float) -> void:
	var p_pos = $CharacterBody2D.position
	var c_pos = $Camera2D.position
	if c_pos > p_pos || c_pos < p_pos:
		$Camera2D.position = $CharacterBody2D.position
