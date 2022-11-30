extends VisibilityNotifier2D

func _ready():
	pass
	
func _physics_process(delta):
	if not $".".is_on_screen():
		$".".get_tree().reload_current_scene()
		
