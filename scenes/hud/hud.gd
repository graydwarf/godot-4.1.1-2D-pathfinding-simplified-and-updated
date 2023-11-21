extends CanvasLayer

func _process(_delta: float) -> void:
	%FpsLabel.text = "FPS: %d" % Engine.get_frames_per_second()

func _on_show_help_about_button_pressed() -> void:
	var helpAboutScreen = load("res://scenes/help-about-screen/help-about-screen.tscn").instantiate()
	add_child(helpAboutScreen)
