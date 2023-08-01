extends Label

# we can do array.size() to get its length
# we can also do len(array) to get its length
# len() can be used for anything, not just arrays
var finalData
func _ready(): # on load it gets the data from the JSON file
	# Create a file object.
	var file = FileAccess.open("res://data/QuestionsAndAnswers.json", FileAccess.READ)
	var categoryLabel = get_node("/root/GameScene/WhiteBackground/Category") # get the category label node
	# Get the content of the file as a string.
	var content_as_text = file.get_as_text()

	# Close the file.
	file.close()

	# Parse the JSON text into a dictionary.
	var content_as_dictionary = JSON.parse_string(content_as_text)
	# content_as_dictionary[0].category, content_as_dictionary[0].question, content_as_dictionary[0].answer
	finalData = content_as_dictionary[randi() % content_as_dictionary.size()] # this gets a random object in the array (JSON file)
	self.text = finalData.question 
	categoryLabel.text = finalData.category
	print(finalData)

