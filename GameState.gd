extends Node

# Old implementation
#var state := {
	#"health": 100,
	#"key": 0
#}

# newer/updated version of state values
var state := {
	"health": 100,
	"key": null,  # Tracks the currently held key
	"holding_key": false,  # Tracks if the player is holding a key
	"keyNumber": 0  # Global counter for deposited keys
}

func get_value(key):
	if state.has(key):
		return state[key]
		
	printerr("Key not present in state: ", key)	
	
func set_value(key, value):
	state[key] = value	
