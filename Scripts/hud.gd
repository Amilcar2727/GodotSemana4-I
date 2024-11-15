extends CanvasLayer

signal start_game;

func show_message(text):
	$Message.text = text;
	$Message.show();
	$MessageTimer.start();

func update_score(score):
	$ScoreLabel.text = str(score);

func show_game_over():
	show_message("Game Over");
	await $MessageTimer.timeout;
	# STOP
	$Message.text = "Dodge the Creeps!";
	$Message.show();
	
	await get_tree().create_timer(1.0).timeout;
	$StartButton.show();
	

func _on_start_button_pressed():
	$StartButton.hide();
	start_game.emit();

func _on_message_timer_timeout():
	$Message.hide();
