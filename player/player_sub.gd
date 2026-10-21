extends CharacterBody3D
@onready var camera = $head/Camera3D
const camera_speed = .005
const SPEED = 3
const UDSPEED = .5
const accerlation = 3
var turn_speed = 0

func _process(_delta):
	var direction = Input.get_axis("right", "left")
	turn_speed = move_toward(turn_speed,camera_speed*direction, .001 * _delta)
	rotate_y(turn_speed)
		
	
	#if Input.is_action_pressed("left"):
	#	rotate_y(move_toward(camera_speed,camera_speed, camera_speed * _delta))
		
	#if Input.is_action_pressed("right"):
	#	rotate_y(move_toward(camera_speed, -camera_speed, camera_speed * _delta))
	
func _physics_process(_delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("filler", "fillerr", "forward", "backward")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	
	if Input.is_action_pressed("up"):
		velocity.y = UDSPEED
	elif Input.is_action_pressed("down"):
		velocity.y = -UDSPEED
	else:
		velocity.y = move_toward(velocity.y,0,UDSPEED * _delta)
		
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED * _delta)
		velocity.z = move_toward(velocity.z, 0, SPEED * _delta)

	move_and_slide()
