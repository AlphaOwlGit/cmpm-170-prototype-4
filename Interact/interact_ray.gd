extends RayCast3D

@onready var prompt = $Prompt

func _physics_process(delta: float) -> void:
	prompt.text = ""
	if is_colliding():
		var collider = get_collider()
		
		if collider is Interactable:
			prompt.text = collider.obj_prompt
