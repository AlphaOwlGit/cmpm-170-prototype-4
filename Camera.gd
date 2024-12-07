extends Camera3D

# State to track if the camera is locked onto the map
var is_locked: bool = false

# Called every frame
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		toggle_camera_lock()

# Function to toggle camera lock
func toggle_camera_lock() -> void:
	if is_locked:
		release_camera()
	else:
		lock_camera()

# Function to lock the camera
func lock_camera() -> void:
	is_locked = true
	# Adjust the camera properties or behavior to lock onto the map
	print("Camera locked onto the map")
	# Example: Setting position or constraints

# Function to release the camera
func release_camera() -> void:
	is_locked = false
	# Adjust the camera properties or behavior to release control
	print("Camera released from the map")
	# Example: Resetting position or constraints
