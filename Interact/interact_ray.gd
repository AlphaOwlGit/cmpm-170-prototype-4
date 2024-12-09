extends RayCast3D

@onready var prompt = $Prompt

func _physics_process(delta: float) -> void:
	prompt.text = ""
	if is_colliding():
		var collider = get_collider()
		
		if collider is Interactable:
			if collider is Lockbox and GameState.get_value("key") == 0:
				prompt.text = ""
			elif collider is Key and GameState.get_value("key") == 1:
				prompt.text = "Deposit the key first!"
			elif collider is Map and GameState.get_value("keyNumber") != 8:
				prompt.text = ""
			else: prompt.text = collider.get_prompt()

			if Input.is_action_just_pressed(collider.prompt_input):
				collider.interact(owner)
