extends CharacterBody3D
@onready var camera = $head/Camera3D
const camera_speed = .005 # max camera speed when turning left or right
const SPEED = 3 #Max speed whe moving forward backward
const UDSPEED = 2 #Max speed for going up or down
var turn_speed = 0 #holds turn speeds that updates with each input trigger.

func _process(_delta):
	var direction = Input.get_axis("right", "left")
	turn_speed = move_toward(turn_speed,camera_speed*direction, .001 * _delta)
	rotate_y(turn_speed)
	# 	get_axis returns a float between -1, 0 and 1 depending on if the left or right
	# button is pressed. Neither/both returns the same float. 
	# move_toward is broken down to 3 inputs, Current speed, Max/target speed, Acceleration. 
	# turn_speed starts at 0 and increases when each trigger until max. 
	
func _physics_process(_delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("filler", "fillerr", "forward", "backward")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	
	# Updated speed from the archived code to be the same as turning. 
	var up_down = Input.get_axis("down","up")
	velocity.y = move_toward(velocity.y,UDSPEED*up_down,1.5 * _delta)
	
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED * _delta)
		velocity.z = move_toward(velocity.z, 0, SPEED * _delta)

	move_and_slide()
	#OLD CODE BELOW FOR ACHIVE'S SAKE:
#if Input.is_action_pressed("left"):
	#	rotate_y(move_toward(camera_speed,camera_speed, camera_speed * _delta))
		
	#if Input.is_action_pressed("right"):
	#	rotate_y(move_toward(camera_speed, -camera_speed, camera_speed * _delta))
	
	# if Input.is_action_pressed("up"):
	#    velocity.y = UDSPEED
   # elif Input.is_action_pressed("down"):
	#    velocity.y = -UDSPEED
   # else:
	#velocity.y = move_toward(velocity.y,0,UDSPEED)
