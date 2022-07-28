extends State

export var defeat_path: NodePath

onready var _defeat = get_node(defeat_path) as Defeat


func enter(_msg := {}) -> void:
	_defeat.show()
	_defeat.connect("retry", self, "_on_retry")


func _on_retry():
	var main = get_node("/root/Main")
	main.remove_child(get_node("/root/Main/Drill"))
	self.state_machine.transition_to("Init")
