extends Control




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_back_button_pressed():
	self.visible = false


func _on_options_pressed():
	self.visible = true


func _on_video_button_pressed():
	self.visible = false
