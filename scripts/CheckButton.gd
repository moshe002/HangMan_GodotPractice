extends Button
# CHECK BUTTON TEXT/INPUT
var inputText

func _ready(): 
	inputText = get_node("/root/GameScene/WhiteBackground/LineEdit")

func _on_pressed():
	if inputText != null:
		var answer = inputText.text
		print(answer)
