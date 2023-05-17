extends Control






func _on_hush_pressed():
	self.visible = true



func _on_Check_pressed():
	if $LineEdit.text == "Chippy":
		$checkText.text = "Correct"
		$ColorRect.visible = false
		$Label.visible = false
		$LineEdit.visible = false
		$checkText.visible = false
		$Check.visible = false
		$Buttons.visible = true
	else:
		$Buttons.visible = false
		$checkText.text = "Wrong please try again."


func _on_StartArea_pressed():
	print("to main")


func _on_Station1_pressed():
	print("to station1")




func _on_InsideTrain_pressed():
	print("to train")


func _on_Station2_pressed():
	print("to station2")


func _on_INF_Health_pressed():
	print("inf health")



func _on_INF_Damage_pressed():
	print("inf damage")


func _on_Town_pressed():
	print("To Town")


func _on_INF_Coins_pressed():
	print("inf coins")


func _on_back_pressed():
	self.visible = false
	$checkText.text = " "
	$Buttons.visible = false



