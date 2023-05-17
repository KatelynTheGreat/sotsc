extends Button




func _on_mouse_entered():
	$GradientRect.gradient = Gradient.new()
	$GradientRect.gradient.add_color(0, Color.BLACK)
	$GradientRect.gradient.add_color(0.5, Color.BLACK)
	$GradientRect.gradient.add_color(1, Color.BLACK)



func _on_gradient_rect_mouse_exited():
	$GradientRect.gradient = Gradient.new()
	$GradientRect.gradient.add_color(0, $GradientRect.color)
	$GradientRect.gradient.add_color(0.5, $GradientRect.color)
	$GradientRect.gradient.add_color(1, $GradientRect.color)
	
