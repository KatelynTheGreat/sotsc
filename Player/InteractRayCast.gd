extends RayCast3D


func _process(delta):
	if self.is_colliding():
		var collider = self.get_collider()
		var obj_col = collider.get_parent()
		if Input.is_action_just_pressed("Interact"):
			var name = collider.get_name()
			print("object,",name)
			if name == "block":
				print("yay ye found a block")
