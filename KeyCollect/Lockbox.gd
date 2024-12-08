extends Interactable

func _on_interacted(_body:):
	if GameState.get_value("key"):
		GameState.set_value("keyNumber", GameState.get_value("keyNumber") + 1)
		print(GameState.get_value("keyNumber"))
		var key = GameState.get_value("key")
		GameState.get_value("key").queue_free()
		GameState.set_value("key", null)
