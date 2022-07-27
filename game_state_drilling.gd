extends State


var drill: Drill


func enter(_msg := {}) -> void:
	drill = owner.drill as Drill
	drill.start()
	drill.connect("hit_target", self, "_on_hit_target")
	drill.connect("hit_obstacle", self, "_on_hit_obstacle")


func handle_input(event: InputEvent) -> void:
	if event.is_action_pressed("drill_toggle"):
		drill.toggle()


func _on_hit_target(area: Area2D) -> void:
	state_machine.transition_to("Victory")


func _on_hit_obstacle(area: Area2D) -> void:
	state_machine.transition_to("Defeat")


func exit() -> void:
	drill.stop()
