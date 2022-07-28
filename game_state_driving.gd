extends State


var drill: Drill

var left_is_hidden := false
var right_is_hidden := false


func enter(_msg := {}) -> void:
	drill = owner.drill as Drill


func handle_input(event: InputEvent) -> void:
	if event.is_action_pressed("drill_start"):
		if left_is_hidden and right_is_hidden:
			state_machine.transition_to("Drilling")

	if event.is_action_pressed("drive_left"):
		drill.hide_drive_left_controls()
		left_is_hidden = true
		if right_is_hidden:
			drill.show_drill_controls()

	if event.is_action_pressed("drive_right"):
		drill.hide_drive_right_controls()
		right_is_hidden = true
		if left_is_hidden:
			drill.show_drill_controls()



func process(delta) -> void:
	if Input.is_action_pressed("drive_left"):
		drill.drive_left()

	if Input.is_action_pressed("drive_right"):
		drill.drive_right()
