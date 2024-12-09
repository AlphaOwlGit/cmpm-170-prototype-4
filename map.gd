extends Interactable
class_name Map

func _on_interacted(body: Variant) -> void:
	if GameState.get_value("keyNumber") == 8:
		$AudioStreamPlayer3D.play()
	
