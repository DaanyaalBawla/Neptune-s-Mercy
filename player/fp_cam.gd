extends Node3D
#
#var sensitivity = 0.02
#func _ready() -> void:
	#Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
#
#func _input(event: InputEvent) -> void:
	#if event is InputEventMouseMotion:
		#get_parent().rotate_y(deg_to_rad(-event.relative.x * sensitivity))
		#rotate_x(deg_to_rad(-event.relative.y * sensitivity))
		#rotation.x = clamp(rotation.x, deg_to_rad(-90), deg_to_rad(90))
	# Free mouse on esc
	#if event.is_action_pressed("esc"):
		#Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
