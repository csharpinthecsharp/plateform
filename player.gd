extends Node2D

func _physics_process(delta: float) -> void:
	var p_pos = $CharacterBody2D.position
	var c_pos = $Camera2D.position
	
	if c_pos > p_pos || c_pos < p_pos:
		$Camera2D.position = p_pos
		
	if $CharacterBody2D/death_music.playing:
			$spawn_music.stop()
	else:
		if not $spawn_music.playing:
			$spawn_music.play()			
