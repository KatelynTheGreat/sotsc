extends CharacterBody3D

signal walL

var speed = 50
var acceleration = 5
var gravity = 0.98
var jump_power = 30
var mouse_sensitivity = 0.3
var cooldown = false
var DEstamina = 100
var INstamina = 0

@onready var head = $Head
@onready var camera = $Head/Camera
@onready var Raycast = $Head/Camera/RayCast

var velocty = Vector3()
var camera_x_rotation = 0
var clicks = 0
var crouch_speed = 30
var crouched = false




func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	

func _input(event):
	if event is InputEventMouseMotion:
		head.rotate_y(deg_to_rad(-event.relative.x * mouse_sensitivity))

		var x_delta = event.relative.y * mouse_sensitivity
		if camera_x_rotation + x_delta > -90 and camera_x_rotation + x_delta < 90: 
			camera.rotate_x(deg_to_rad(-x_delta))
			camera_x_rotation += x_delta

var max_stamina = 100
var current_stamina = 100
var stamina_drain_rate = 10
var stamina_regeneration_rate = 5

func _process(delta):
	
	if Input.is_action_just_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		#get_tree().free()

	if Input.is_action_pressed("Shift"):
		if crouched == true:
			speed = 30
			current_stamina = clamp(current_stamina + stamina_regeneration_rate * delta, 0, max_stamina)
			$Stamina_Insanity/Stamina.value = current_stamina
		else:
			current_stamina = clamp(current_stamina - stamina_drain_rate * delta, 0, max_stamina)
			$Stamina_Insanity/Stamina.value = current_stamina
			speed = 100
	else:
		current_stamina = clamp(current_stamina + stamina_regeneration_rate * delta, 0, max_stamina)
		$Stamina_Insanity/Stamina.value = current_stamina
		speed = 50
		
		

func _physics_process(delta):
	var head_basis = head.get_global_transform().basis
	
	if Input.is_action_pressed("Interact"):
		if Raycast.is_colliding():
			var collider = Raycast.get_collider()
			if collider.get_name() == "wall":
				print("This a wall")
				emit_signal("walL")
			else:
				print("Not sure")
	var space_state = get_world_3d().direct_space_state
	if Input.is_action_just_pressed("Crouch"):
		var crouchedResult = space_state.intersect_ray( PhysicsRayQueryParameters3D.create(position, position + Vector3(0,2,0), 1, [self.get_rid()]))
		if crouchedResult.size() == 0:
			if crouched == true:
				$AnimationPlayer.play("UnCrouch")
				crouched = false
				speed = 50
				return
			if crouched == false:
				$AnimationPlayer.play("Crouch")
				speed = 30
				crouched = true
				return
	
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






func _on_visible_on_screen_enabler_3d_screen_entered():
	print("watch out!")
	$Stamina_Insanity/Insanity.value = $Stamina_Insanity/Insanity.value + 10
	

