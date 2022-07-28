extends State


var _drill: Drill
var _left_is_hidden := false
var _right_is_hidden := false


func enter(_msg := {}) -> void:
	_drill = get_node("/root/Main/Drill") as Drill


func handle_input(event: InputEvent) -> void:
	if event.is_action_pressed("drill_start"):
		if _left_is_hidden and _right_is_hidden:
			state_machine.transition_to("Drilling")

	if event.is_action_pressed("drive_left"):
		_drill.hide_drive_left_controls()
		_left_is_hidden = true
		if _right_is_hidden:
			_drill.show_drill_controls()

	if event.is_action_pressed("drive_right"):
		_drill.hide_drive_right_controls()
		_right_is_hidden = true
		if _left_is_hidden:
			_drill.show_drill_controls()



func process(delta) -> void:
	if Input.is_action_pressed("drive_left"):
		_drill.drive_left()

	if Input.is_action_pressed("drive_right"):
		_drill.drive_right()
