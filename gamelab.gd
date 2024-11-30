extends Node3D

@onready var camera1 = $MapCamera
@onready var camera2 = $CharacterBody3D/Neck/PlayerCamera

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("interact"):
		if camera1.is_current():
			camera1.clear_current(true)
		elif camera2.is_current():
			camera2.clear_current(true)
