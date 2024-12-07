extends RayCast3D

@onready var prompt = $Prompt

# Old version / implementation

func _physics_process(delta: float) -> void:
	prompt.text = ""
	if is_colliding():
		var collider = get_collider()
		prompt.text = collider.name
		
		if collider is Interactable:
			prompt.text = collider.get_prompt()

			if Input.is_action_just_pressed(collider.prompt_input):
				collider.interact(owner)
				
