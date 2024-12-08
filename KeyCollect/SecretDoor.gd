extends CSGBox3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if GameState.get_value("key") >= 5:
		self.set_collision_layer_value(1, false)
		self.set_visible(false)
