extends Button
# CHECK BUTTON TEXT/INPUT
var content_as_dictionary
var finalData
var inputText
var QuestionLabel
var CategoryLabel
# gets the input text field node
func _ready(): 
	inputText = get_node("/root/GameScene/WhiteBackground/LineEdit")
	QuestionLabel = get_node("/root/GameScene/WhiteBackground/Question")
	CategoryLabel = get_node("/root/GameScene/WhiteBackground/Category")
	_get_data()

func _on_pressed():
	if inputText != null: # checks if node exists
		if inputText.text != "": # checks if node does have input
			var userInput = inputText.text.to_lower() 
			print("User entered: " + userInput)
			var realAnswer = finalData.answer.to_lower()
			if realAnswer == userInput:
				print("Correct answer")
				inputText.text = ""
				_get_data()
			else: 
				print("Wrong answer")
		else:
			print("Empty field")
			
func _get_data():
	# Create a file object.
	var file = FileAccess.open("res://data/QuestionsAndAnswers.json", FileAccess.READ)
	var categoryLabel = get_node("/root/GameScene/WhiteBackground/Category") # get the category label node
	# Get the content of the file as a string.
	var content_as_text = file.get_as_text()

	# Close the file.
	file.close()

	# Parse the JSON text into a dictionary.
	content_as_dictionary = JSON.parse_string(content_as_text)
	# content_as_dictionary[0].category, content_as_dictionary[0].question, content_as_dictionary[0].answer
	finalData = content_as_dictionary[randi() % content_as_dictionary.size()] # this gets a random object in the array (JSON file)
	QuestionLabel.text = finalData.question 
	categoryLabel.text = finalData.category
	print(finalData)
	
# make it so that rare ra mo balik ang question kay so far magbalik2 siya frequently
