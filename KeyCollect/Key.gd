extends Interactable
class_name Key

#@onready var player = $Player
#@onready var indicator = $KeyIndi

#var picked_up = false  # Whether the key is currently picked up
#var obj = null
#@onready var point = $"../Hold"

func _on_interacted(_body:):
	if GameState.get_value("key") == 0:
		GameState.set_value("key", GameState.get_value("key") + 1)
		print(GameState.get_value("key"))
		$AudioStreamPlayer3D.play()
		queue_free()
		GameState.set_value("holding_key", true)
		print(GameState.get_value("holding_key"))
	
	#if not picked_up:
	#	# Pick up the key
	#	picked_up = true
	#	self.freeze = true  # Stop the physics simulation for this body
	#	self.global_transform.origin = player.global_transform.origin + Vector3(0, 1, 0)  # Position above player
	#	player.add_child(self)  # Attach the key to the player
	#	GameState.set_value("key", GameState.get_value("key") + 1)
	#elif picked_up:
	#	# Drop the key
	#	picked_up = false
	#	self.freeze = false  # Re-enable physics simulation
	#	self.get_parent().remove_child(self)  # Detach the key from the player
	#	self.global_transform.origin += Vector3(0, -0.5, 0)  # Slight adjustment to drop position
	#	GameState.set_value("key", GameState.get_value("key") - 1)
	
