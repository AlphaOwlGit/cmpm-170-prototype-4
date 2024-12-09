extends Interactable
class_name Map

func _on_interacted(body: Variant) -> void:
	$AudioStreamPlayer3D.play()
	
