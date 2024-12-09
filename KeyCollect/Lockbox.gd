extends Interactable
class_name Lockbox

func _on_interacted(_body:):
	if GameState.get_value("key") > 0:
		GameState.set_value("keyNumber", GameState.get_value("keyNumber") + 1)
		GameState.set_value("key", GameState.get_value("key") - 1)
		GameState.set_value("holding_key", false)
		print(GameState.get_value("keyNumber"))
		$AudioStreamPlayer3D.play()

# Implementing interaction and deposit with Lockbox (in progress), check code

#@export var required_key_name: String = "Key"  # Expected key name for this lockbox
#
#func deposit_key():
	#var key = GameState.get_value("key")
	#if key and key.name == required_key_name:
		#print("Key successfully deposited into the lockbox!")
		#
		## Remove the key from the map and GameState
		#key.queue_free()
		#GameState.set_value("key", null)
		#GameState.set_value("holding_key", false)
		#
		## Update global counter
		#var deposited_keys = GameState.get_value("keyNumber") or 0
		#GameState.set_value("keyNumber", deposited_keys + 1)
		#print("Total keys deposited: ", GameState.get_value("keyNumber"))
	#else:
		#print("No valid key to deposit.")
