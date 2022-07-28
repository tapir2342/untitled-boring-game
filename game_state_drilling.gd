extends State


var _drill: Drill


func enter(_msg := {}) -> void:
	_drill = get_node("/root/Main/Drill") as Drill
	_drill.hide_drill_controls()
	_drill.start()
	_drill.connect("hit_target", self, "_on_hit_target")
	_drill.connect("hit_obstacle", self, "_on_hit_obstacle")


func handle_input(event: InputEvent) -> void:
	if event.is_action_pressed("drill_toggle"):
		_drill.toggle()


func _on_hit_target(area: Area2D) -> void:
	state_machine.transition_to("Victory")


func _on_hit_obstacle(area: Area2D) -> void:
	state_machine.transition_to("Defeat")


func exit() -> void:
	_drill.stop()
