extends Button
# CHECK BUTTON TEXT/INPUT
var content_as_dictionary
var finalData
var inputText
var QuestionLabel 
var CategoryLabel 
var ResultLabel
#var delayTimer
# gets the input text field node
func _ready(): 
	inputText = get_node("/root/GameScene/WhiteBackground/LineEdit")
	QuestionLabel = get_node("/root/GameScene/WhiteBackground/Question")
	CategoryLabel = get_node("/root/GameScene/WhiteBackground/Category")
	ResultLabel = get_node("/root/GameScene/WhiteBackground/ResultLabel")	
	#delayTimer = get_node("/root/GameScene/WhiteBackground/Timer")
	_get_data()

func _on_pressed():
	if inputText != null: # checks if node exists
		if inputText.text != "": # checks if node does have input
			var userInput = inputText.text.to_lower() 
			print("User entered: " + userInput)
			var realAnswer = finalData.answer.to_lower()
			if realAnswer == userInput: # IF ANSWER IS CORRECT
				print("Correct answer")
				ResultLabel.visible = true 
				ResultLabel.set("theme_override_colors/font_color", Color(0,1,0,1))
				# Color(0, 1, 0, 1) green
				ResultLabel.text = "Correct"
				inputText.text = ""
				_get_data()
			else: # IF ANSWER IS WRONG
				ResultLabel.visible = true
				ResultLabel.set("theme_override_colors/font_color", Color(1, 0, 0, 1))
				# Color(1, 0, 0, 1) red
				ResultLabel.text = "Wrong"
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
	# make it so that rare ra mo balik ang question kay so far magbalik2 siya frequently
	QuestionLabel.text = finalData.question 
	categoryLabel.text = finalData.category
	print(finalData)
				
func _on_timer_timeout(): # make it so that it will display for 2 seconds and not go away immediately
	ResultLabel.visible = !true
