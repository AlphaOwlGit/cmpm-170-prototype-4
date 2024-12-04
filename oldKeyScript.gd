extends RigidBody3D

signal show_prompt(state: bool)  # Signal to show or hide the pickup prompt

var picked_up = false  # Whether the key is currently picked up
var player = null  # Reference to the player holding the key

func _ready():
	# Nothing needed for now
	pass

func _process(delta):
	if Input.is_action_just_pressed("interact") and player and not picked_up:
		# Pick up the key
		picked_up = true
		self.freeze = true  # Stop the physics simulation for this body
		self.global_transform.origin = player.global_transform.origin + Vector3(0, 1, 0)  # Position above player
		player.add_child(self)  # Attach the key to the player
		emit_signal("show_prompt", false)  # Hide the prompt when picked up
	elif Input.is_action_just_pressed("interact") and picked_up:
		# Drop the key
		picked_up = false
		self.freeze = false  # Re-enable physics simulation
		self.get_parent().remove_child(self)  # Detach the key from the player
		self.global_transform.origin += Vector3(0, -0.5, 0)  # Slight adjustment to drop position

func _on_body_entered(body):
	# Detect when the player is near the key
	if body.name == "Player":
		player = body  # Store the player reference
		emit_signal("show_prompt", true)  # Show the pickup prompt

func _on_body_exited(body):
	# Clear the player reference when they move away
	if body.name == "Player":
		player = null
		emit_signal("show_prompt", false)  # Hide the pickup prompt
