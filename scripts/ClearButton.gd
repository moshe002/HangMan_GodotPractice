extends Button
# CLEAR BUTTON TEXT/INPUT

var inputText
var onclickAudio

func _ready(): 
	inputText = get_node("/root/GameScene/WhiteBackground/LineEdit")
	onclickAudio = get_node("/root/GameScene/OnClickAudio")

func _on_pressed():
	if inputText != null:
		inputText.clear()
		onclickAudio.play()
		#print("Text cleared")
	

