extends Node2D

onready var _l: Sprite = $DriveLeft
onready var _r: Sprite = $DriveRight
onready var _d: Sprite = $Drill

onready var _l_tween: Tween = $DriveLeftTween
onready var _r_tween: Tween = $DriveRightTween
onready var _d_tween: Tween = $DrillTween

var _scale_start = Vector2(0.7, 0.7)
var _scale_end = Vector2(1, 1)
var _duration = 1

func _ready():
	_l_tween.interpolate_property(
		_l,
		"scale",
		_scale_start,
		_scale_end,
		_duration,
		Tween.TRANS_LINEAR,
		Tween.EASE_IN_OUT
	)
	_l_tween.start()
	_l_tween.repeat = true

	_r_tween.interpolate_property(
		_r,
		"scale",
		_scale_start,
		_scale_end,
		_duration,
		Tween.TRANS_LINEAR,
		Tween.EASE_IN_OUT,
		0.3
	)
	_r_tween.start()
	_r_tween.repeat = true

	_d_tween.interpolate_property(
		_d,
		"scale",
		_scale_start,
		_scale_end,
		_duration,
		Tween.TRANS_LINEAR,
		Tween.EASE_IN_OUT,
		0.3
	)
	_d_tween.start()
	_d_tween.repeat = true
