extends State

const DrillScene := preload("res://drill.tscn")

export var victory_path: NodePath
onready var _victory = get_node(victory_path) as Victory

export var defeat_path: NodePath
onready var _defeat = get_node(defeat_path) as Defeat



func enter(_msg := {}) -> void:
	var drill = DrillScene.instance()
	owner.add_child(drill)
	_victory.hide()
	_defeat.hide()
	state_machine.transition_to("Driving")
