extends CanvasLayer

#@onready var player: CharacterBody3D = $Player
@onready var label: Label = $KeyHave
@onready var label2: Label = $DepositText
@onready var label3: Label = $YouWin

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if GameState.get_value("holding_key") == true:
		label.text = "You have a key!"
	elif GameState.get_value("holding_key") == false:
		label.text = "No Key :("
	if GameState.get_value("keyNumber") > 0:
		label2.text = "Keys Deposited: " + str(GameState.get_value("keyNumber"))		
	if GameState.get_value("keyNumber") == 8:
		label3.visible	= true
