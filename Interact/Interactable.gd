extends CollisionObject3D
class_name Interactable

signal interacted(body)

@export var obj_prompt = "Interact"
@export var prompt_input = "interact"

func get_prompt():
	var key_name = ""
	for action in InputMap.action_get_events(prompt_input):
		if action is InputEventKey:
			key_name = action.as_text_physical_keycode()
			break
			
	return obj_prompt + "\n[" + key_name + "]"		

func interact(body):
	interacted.emit(body)

func _on_interacted(body: Variant) -> void:
	pass # Replace with function body.
