extends State

export var victory_path: NodePath
onready var _victory = get_node(victory_path) as Victory

export var defeat_path: NodePath
onready var _defeat = get_node(defeat_path) as Defeat


func enter(_msg := {}) -> void:
	_victory.hide()
	_defeat.hide()
	state_machine.transition_to("WaitingToStart")
