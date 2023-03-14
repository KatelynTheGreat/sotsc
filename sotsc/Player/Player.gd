extends CharacterBody3D

var speed = 25
var acceleration = 5
var gravity = 0.98
var jump_power = 30
var mouse_sensitivity = 0.3
var cooldown = false
var DEstamina = 100
var INstamina = 0

@onready var head = $Head
@onready var camera = $Head/Camera

var velocty = Vector3()
var camera_x_rotation = 0
var clicks = 0


func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event):
	if event is InputEventMouseMotion:
		head.rotate_y(deg_to_rad(-event.relative.x * mouse_sensitivity))

		var x_delta = event.relative.y * mouse_sensitivity
		if camera_x_rotation + x_delta > -90 and camera_x_rotation + x_delta < 90: 
			camera.rotate_x(deg_to_rad(-x_delta))
			camera_x_rotation += x_delta

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _physics_process(delta):
	var head_basis = head.get_global_transform().basis
	
	if Input.is_action_pressed("Shift"):
		if cooldown == true and clicks == 0:
			clicks = 1

			print("On cooldown")
		if cooldown == false:
			speed = 100
	else:
		speed = 25
	var direction = Vector3()
	if Input.is_action_pressed("move_forward"):
		direction -= head_basis.z
	elif Input.is_action_pressed("move_back"):
		direction += head_basis.z
	
	if Input.is_action_pressed("move_left"):
		direction -= head_basis.x
	elif Input.is_action_pressed("move_right"):
		direction += head_basis.x
	
	direction = direction.normalized()
	
	velocity = velocty.lerp(direction * speed, acceleration * delta)
	velocity.y -= gravity
	
	move_and_slide()
