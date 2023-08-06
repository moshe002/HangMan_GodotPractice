extends Button
# CHECK BUTTON TEXT/INPUT
var content_as_dictionary
var finalData
var inputText
var QuestionInput 
var CategoryInput 
var ResultLabel
var CategoryLabel
var QuestionLabel
var clearButton
var playAgainButton
var YouLoseLabel
var wrongTracker : int = 0 # i dinamically added its type which is an integer (murag typescript)
#var delayTimer
var torso
var leftArm
var rightArm
var head
var leftLeg
var rightLeg
var hangPlatform
var newHangPlatform
# audio
var onclickAudio
var isCorrect
var isWrong
var onDeath
# gets the input text field node
func _ready(): 
	inputText = get_node("/root/GameScene/WhiteBackground/LineEdit")
	QuestionInput = get_node("/root/GameScene/WhiteBackground/Question")
	CategoryInput = get_node("/root/GameScene/WhiteBackground/Category")
	ResultLabel = get_node("/root/GameScene/WhiteBackground/ResultLabel")
	clearButton = get_node("/root/GameScene/WhiteBackground/ClearButton")
	CategoryLabel = get_node("/root/GameScene/WhiteBackground/CategoryLabel")
	QuestionLabel = get_node("/root/GameScene/WhiteBackground/QuestionLabel")
	playAgainButton = get_node("/root/GameScene/WhiteBackground/PlayAgainButton")
	YouLoseLabel = get_node("/root/GameScene/WhiteBackground/YouLoseLabel")
	_get_data()
	#delayTimer = get_node("/root/GameScene/WhiteBackground/Timer")
	# the guy to be hanged
	torso = get_node("/root/GameScene/WhiteBackground/Torso")
	leftArm = get_node("/root/GameScene/WhiteBackground/LeftArm")
	rightArm = get_node("/root/GameScene/WhiteBackground/RightArm")
	head = get_node("/root/GameScene/WhiteBackground/SadHead")
	leftLeg = get_node("/root/GameScene/WhiteBackground/LeftLeg")
	rightLeg = get_node("/root/GameScene/WhiteBackground/RightLeg")
	# hang platform
	hangPlatform = get_node("/root/GameScene/WhiteBackground/HangPlatform")
	newHangPlatform = get_node("/root/GameScene/WhiteBackground/NewHangPlatform")
	# audio
	onclickAudio = get_node("/root/GameScene/OnClickAudio")
	isCorrect = get_node("/root/GameScene/IsCorrect")
	isWrong = get_node("/root/GameScene/IsWrong")
	onDeath = get_node("/root/GameScene/OnDeath")
	
func _on_pressed():
	onclickAudio.play()
	if inputText != null: # checks if node exists
		if inputText.text != "": # checks if node does have input
			var userInput = inputText.text.to_lower() 
			print("User entered: " + userInput)
			var realAnswer = finalData.answer.to_lower()
			if realAnswer == userInput: # IF ANSWER IS CORRECT
				isCorrect.play()
				print("Correct answer")
				ResultLabel.visible = true 
				ResultLabel.set("theme_override_colors/font_color", Color(0,1,0,1))
				# Color(0, 1, 0, 1) green
				ResultLabel.text = "Correct"
				inputText.text = ""
				_get_data()
			else: # IF ANSWER IS WRONG
				isWrong.play()
				ResultLabel.visible = true
				ResultLabel.set("theme_override_colors/font_color", Color(1, 0, 0, 1))
				# Color(1, 0, 0, 1) red
				ResultLabel.text = "Wrong"
				print("Wrong answer")
				wrongTracker += 1
				_check_wrongTracker(wrongTracker)
				if wrongTracker == 6:
					self.visible = false
					clearButton.visible = false
					QuestionInput.visible = false
					CategoryInput.visible = false
					inputText.visible = false
					CategoryLabel.visible = false
					QuestionLabel.visible = false
					ResultLabel.visible = false
					playAgainButton.visible = true
					YouLoseLabel.visible = true
					inputText.text = ""
					wrongTracker = 0
					_get_data()
					# display play again button
					# reset the game
		else:
			ResultLabel.visible = true
			ResultLabel.set("theme_override_colors/font_color", Color(1, 0, 0, 1))
			ResultLabel.text= "Empty field"
			
func _get_data():
	# Create a file object.
	var file = FileAccess.open("res://data/QuestionsAndAnswers.json", FileAccess.READ)
	# Get the content of the file as a string.
	var content_as_text = file.get_as_text()

	# Close the file.
	file.close()

	# Parse the JSON text into a dictionary.
	content_as_dictionary = JSON.parse_string(content_as_text)
	# content_as_dictionary[0].category, content_as_dictionary[0].question, content_as_dictionary[0].answer
	finalData = content_as_dictionary[randi() % content_as_dictionary.size()] # this gets a random object in the array (JSON file)
	# make it so that rare ra mo balik ang question kay so far magbalik2 siya frequently
	QuestionInput.text = finalData.question 
	CategoryInput.text = finalData.category
	print(finalData)
				
func _on_timer_timeout(): # make it so that it will display for 2 seconds and not go away immediately
	ResultLabel.visible = !true

func _check_wrongTracker(wrongTracker: int):
	if wrongTracker == 1:
		#show torso
		torso.visible = true
	elif wrongTracker == 2:
		# show torso and left arm
		torso.visible = true
		leftArm.visible = true
	elif wrongTracker == 3:
		# show torso, left arm and right arm
		torso.visible = true
		leftArm.visible = true
		rightArm.visible = true
	elif wrongTracker == 4:
		# show torso, both arms, and head
		hangPlatform.visible = false
		newHangPlatform.visible = true
		torso.visible = true
		leftArm.visible = true
		rightArm.visible = true
		head.visible = true
	elif wrongTracker == 5:
		# show torso, both arms, head and left leg
		torso.visible = true
		leftArm.visible = true
		rightArm.visible = true
		head.visible = true
		leftLeg.visible = true
	elif wrongTracker == 6:
		# show torso, both arms, head and both legs
		torso.visible = true
		leftArm.visible = true
		rightArm.visible = true
		head.visible = true
		leftLeg.visible = true
		rightLeg.visible = true
		onDeath.play()
