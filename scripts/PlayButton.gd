extends Button
# play button

var onClickAudio
var timerDelay

func _ready():
	onClickAudio = get_node("OnClickAudio")
	timerDelay = get_node("TimerDelay")

func _on_pressed():
	#onClickAudio.play()
	onClickAudio.play()
	timerDelay.start()

func _on_timer_delay_timeout():
	get_tree().change_scene_to_file("res://game_scene.tscn")

