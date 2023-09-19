extends CanvasLayer

signal start_game

var player

func _ready():
	player = get_node("../Player")
	player.hide()

func show_message(text):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()
	
func show_game_over():
	show_message("goodbyeee~*")
	player.hide()
	await $MessageTimer.timeout
	
	$Message.text = "tom-agotchi :-)"
	$Message.show()
	
	
	# Make a one-shot timer and wait for it to finish.
	await get_tree().create_timer(1.0).timeout
	$StartButton.show()
	
func _on_start_button_pressed():
	$StartButton.hide()
	$Message.hide()
	player.show()
	start_game.emit()

func _on_message_timer_timeout():
	await start_game
	$Message.hide()
