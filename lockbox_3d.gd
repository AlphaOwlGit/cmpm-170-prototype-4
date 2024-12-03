extends Area3D

func _ready():
	# Connect the signal to detect when a body enters the lockbox's area
	connect("body_entered", Callable(self, "_on_body_entered"))

func _on_body_entered(body):
	# Check if the entering body is the key
	if body.name == "Key":
		print("Key successfully placed in lockbox!")
		body.queue_free()  # Remove the key
		queue_free()  # Optionally remove the lockbox if it's single-use
