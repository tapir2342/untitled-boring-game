extends Node2D


onready var _stick: Node2D = $Stick

var _direction := Vector2(0, 1)
var speed := 3.0
var angle: float
var angle_delta := 0.42
var bias := -1
var stick_rotation_neutral = -90
var stick_rotation_delta = 30


func _physics_process(delta):
	angle += deg2rad(angle_delta * bias)
	#_direction = Vector2(-cos(_stick.rotation), -sin(_stick.rotation))
	#_direction = _direction.normalized().rotated(angle)
	global_position += _direction.rotated(angle).normalized() * speed


func toggle() -> void:
	bias = -1 * bias
