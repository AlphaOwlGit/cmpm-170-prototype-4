extends Node3D

@onready var camera1 = $MapCamera
@onready var camera2 = $Player/Neck/PlayerCamera

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_map_interaction(body: Variant) -> void:
	if camera2.is_current():
		camera2.clear_current(true)
		camera1.set_current(true)
	elif camera1.is_current():
		camera1.clear_current(true)
		camera2.set_current(true)
