extends Node3D

@onready var camera := $Camera3D
@onready var mouse_sensitivity = 0.001



func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	elif event.is_action_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		if event is InputEventMouseMotion:
			#camera.rotate_x(-event.relative.y * 0.01)
			camera.rotate_y(-event.relative.x * 0.01)
			#camera.rotation.x = clamp(camera.rotation.x, -30, 60)
			camera.rotation.y = clamp(camera.rotation.y, -30, 60)


