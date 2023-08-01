extends Button
# CHECK BUTTON TEXT/INPUT
var inputText

# gets the input text field node
func _ready(): 
	inputText = get_node("/root/GameScene/WhiteBackground/LineEdit")

func _on_pressed():
	if inputText != null: # checks if node exists
		if inputText.text != "": # checks if node does have input
			var answer = inputText.text.to_lower() 
			print(answer)
		else:
			print("Empty field")
