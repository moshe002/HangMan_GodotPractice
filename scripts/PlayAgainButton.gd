extends Button

var inputText
var QuestionInput 
var CategoryInput 
var ResultLabel
var CategoryLabel
var QuestionLabel
var clearButton
var checkButton
var YouLoseLabel

var torso
var leftArm
var rightArm
var head
var leftLeg
var rightLeg

var hangPlatform
var newHangPlatform

func _ready():
	inputText = get_node("/root/GameScene/WhiteBackground/LineEdit")
	QuestionInput = get_node("/root/GameScene/WhiteBackground/Question")
	CategoryInput = get_node("/root/GameScene/WhiteBackground/Category")
	ResultLabel = get_node("/root/GameScene/WhiteBackground/ResultLabel")
	clearButton = get_node("/root/GameScene/WhiteBackground/ClearButton")
	checkButton = get_node("/root/GameScene/WhiteBackground/CheckButton")
	CategoryLabel = get_node("/root/GameScene/WhiteBackground/CategoryLabel")
	QuestionLabel = get_node("/root/GameScene/WhiteBackground/QuestionLabel")
	YouLoseLabel = get_node("/root/GameScene/WhiteBackground/YouLoseLabel")

	torso = get_node("/root/GameScene/WhiteBackground/Torso")
	leftArm = get_node("/root/GameScene/WhiteBackground/LeftArm")
	rightArm = get_node("/root/GameScene/WhiteBackground/RightArm")
	head = get_node("/root/GameScene/WhiteBackground/SadHead")
	leftLeg = get_node("/root/GameScene/WhiteBackground/LeftLeg")
	rightLeg = get_node("/root/GameScene/WhiteBackground/RightLeg")
	# hang platform
	hangPlatform = get_node("/root/GameScene/WhiteBackground/HangPlatform")
	newHangPlatform = get_node("/root/GameScene/WhiteBackground/NewHangPlatform")

func _on_pressed():
	self.visible = false
	YouLoseLabel.visible = false
	inputText.visible = true
	QuestionInput.visible = true
	CategoryInput.visible = true
	ResultLabel.visible = true
	clearButton.visible = true
	checkButton.visible = true
	CategoryLabel.visible = true
	QuestionLabel.visible = true
	torso.visible = false
	leftArm.visible = false
	rightArm.visible = false
	head.visible = false
	leftLeg.visible = false
	rightLeg.visible = false
	newHangPlatform.visible = false
	hangPlatform.visible = true
