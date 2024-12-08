extends CharacterBody3D

const SPEED = 3.0
const JUMP_VELOCITY = 3.5

var gravity: float = ProjectSettings.get_setting("physics/3d/default_gravity")
@onready var neck := $Neck
@onready var camera := $Neck/PlayerCamera
@onready var ray := $Neck/InteractRay
@onready var pickup_prompt := $PickupPrompt  # Reference to a Label or UI node

# Reference to the object being held
var key = null

func _ready():
	GameState.set_value("key", null)
	GameState.set_value("holding_key", false)

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	elif event.is_action_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		if event is InputEventMouseMotion:
			neck.rotate_y(-event.relative.x * 0.01)
			camera.rotate_x(-event.relative.y * 0.01)
			camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-60), deg_to_rad(90))
			ray.rotate_x(-event.relative.y * 0.01)
			ray.rotation.x = clamp(camera.rotation.x, deg_to_rad(-60), deg_to_rad(90))

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	var input_dir := Input.get_vector("left", "right", "forward", "back")
	var direction = (neck.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()

	# Handle interactions
	if Input.is_action_just_pressed("interact"):
		if GameState.get_value("holding_key"):
			drop_key()
		else:
			try_pick_up_key()
			
	# Trying to implement deposit into lockbox		
	
	## Handle interactions for picking up keys
	#if Input.is_action_just_pressed("interact"):
		#if GameState.get_value("holding_key"):
			#drop_key()
		#else:
			#try_pick_up_key()
#
	## Handle depositing keys into the lockbox
	#if Input.is_action_just_pressed("deposit"):
		#var collider = ray.get_collider()
		#if collider and collider.name == "Lockbox":
			#collider.deposit_key()
			
	if Input.is_action_just_pressed("interact"):
		var collider = ray.get_collider()
		if collider and collider.name == "Lockbox":
			collider.deposit_key()  # Trigger deposit logic in Lockbox
		elif GameState.get_value("holding_key"):
			drop_key()
		else:
			try_pick_up_key()

func try_pick_up_key():
	var collider = ray.get_collider()
	if collider and collider.name == "Key3D":
		GameState.set_value("key", collider)
		var key = GameState.get_value("key")
		key.freeze = true
		GameState.set_value("holding_key", true)
		print(key.global_transform.origin)
		
		key.global_transform.origin += Vector3(0, -5, 0)  # Offset position
		print("Picked up the key!")

func drop_key():
	var key = GameState.get_value("key")
	# Added in an if statement
	if key:
		key.global_transform.origin = neck.global_transform.origin + Vector3(0, -0.5, 0)  # Adjust drop position
		print(key.global_transform.origin)
		print("Dropped the key!")
		GameState.set_value("key", null)
		GameState.set_value("holding_key", false)
		

func _on_show_prompt(state: bool) -> void:
	# Show or hide the pickup prompt
	pickup_prompt.visible = state
