extends State

export var defeat_path: NodePath

onready var _defeat = get_node(defeat_path) as Defeat


func enter(_msg := {}) -> void:
	_defeat.show()
