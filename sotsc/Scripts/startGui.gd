extends Control


func _on_hush_pressed():
	self.visible = false

func _on_back_pressed():
	self.visible = true

func _on_options_pressed():
	self.visible = false


func _on_back_button_pressed():
	self.visible = true


func _on_exit_pressed():
	get_tree().quit()
