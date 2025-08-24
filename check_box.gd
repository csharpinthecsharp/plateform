extends CheckBox

func _ready() -> void:
	connect("toggled", Callable(self, "_toggled"))
		 
func _toggled(toggled_on: bool) -> void:
	if toggled_on:
		$spawn_music.play()
		print("Triggered")
		release_focus()
	else:
		$spawn_music.stop()
		release_focus()
