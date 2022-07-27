extends State

export var victory_path: NodePath
onready var _victory = get_node(victory_path) as Victory


func enter(_msg := {}) -> void:
	_victory.show()
