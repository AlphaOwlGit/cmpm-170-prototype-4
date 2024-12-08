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

# Implementing interaction and deposit with Lockbox (in progress), check code

@export var required_key_name: String = "Key"  # Expected key name for this lockbox

func deposit_key():
	var key = GameState.get_value("key")
	if key and key.name == required_key_name:
		print("Key successfully deposited into the lockbox!")
		
		# Remove the key from the map and GameState
		key.queue_free()
		GameState.set_value("key", null)
		GameState.set_value("holding_key", false)
		
		# Update global counter
		var deposited_keys = GameState.get_value("keyNumber") or 0
		GameState.set_value("keyNumber", deposited_keys + 1)
		print("Total keys deposited: ", GameState.get_value("keyNumber"))
	else:
		print("No valid key to deposit.")
