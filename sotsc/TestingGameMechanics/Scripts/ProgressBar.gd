extends Control



# Called when the node enters the scene tree for the first time.
func _ready():
	pass

var shift_pressed = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_player_sprinting():
	if Input.is_action_pressed("Shift"):
		shift_pressed = true
	else:
		shift_pressed = false

var max_stamina = 100
var current_stamina = 100
var stamina_drain_rate = 10
var stamina_regeneration_rate = 12

func _process(delta):
	if shift_pressed:
		if Input.is_action_pressed("Shift"):
			current_stamina = clamp(current_stamina - stamina_drain_rate * delta, 0, max_stamina)
			$Stamina.value = current_stamina
	if shift_pressed == false:
		current_stamina = clamp(current_stamina + stamina_regeneration_rate * delta, 0, max_stamina)
		$Stamina.value = current_stamina
		print("this should be working!",current_stamina)





