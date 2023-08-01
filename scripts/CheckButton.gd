extends Button
# CHECK BUTTON TEXT/INPUT
var inputText
var answer
# gets the input text field node
func _ready(): 
	inputText = get_node("/root/GameScene/WhiteBackground/LineEdit")
	answer = get_node("/root/GameScene/WhiteBackground/Question")

func _on_pressed():
	if inputText != null: # checks if node exists
		if inputText.text != "": # checks if node does have input
			var userInput = inputText.text.to_lower() 
			print(userInput)
			var realAnswer = answer.finalData.answer.to_lower()
			if realAnswer == userInput:
				print("Correct answer")
				#inputText.text = ""
			else: 
				print("Wrong answer")
		else:
			print("Empty field")
