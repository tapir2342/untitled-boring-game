extends State


func handle_input(event: InputEvent) -> void:
	if event.is_action_pressed("drill_start"):
		state_machine.transition_to("Drilling")
