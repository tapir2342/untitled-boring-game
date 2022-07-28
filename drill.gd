class_name Drill
extends KinematicBody2D

signal hit_obstacle(area2d)
signal hit_target(area2d)

export var cable_color: Color
export var cable_width := 3.0
export var speed := 50
export var funnel_color: Color
export var funnel_width := 50

onready var vehicle_audio_player := $AudioStreamPlayer
onready var tip := $Tip
onready var audio_start := $Start
onready var audio_loop := $Loop
onready var audio_stop := $Stop


var points := PoolVector2Array()

var _velocity := Vector2(0, 0)
var _driving := false


func _draw():
	draw_polyline(points, funnel_color, funnel_width, false)
	draw_polyline(points, cable_color, cable_width, true)


func _ready():
	tip.connect("body_entered", self, "_on_body_entered")
	tip.connect("area_entered", self, "_on_area_entered")
	tip.set_physics_process(false)
	audio_start.connect("finished", self, "_on_audio_start_finished")


func _input(event: InputEvent):
	if event.is_action_pressed("drive_left"):
		vehicle_audio_player.playing = true

	if event.is_action_released("drive_left"):
		vehicle_audio_player.playing = false

	if event.is_action_pressed("drive_right"):
		vehicle_audio_player.playing = true

	if event.is_action_released("drive_right"):
		vehicle_audio_player.playing = false


func _process(delta):
	var collision = self.move_and_collide(_velocity * delta)
	if collision:
		vehicle_audio_player.playing = false
	_velocity.x = 0
	points.append($Tip.position)
	update()


func drive_left():
	_driving = true
	_velocity.x = -speed


func drive_right():
	_driving = true
	_velocity.x = speed


func hide_drive_left_controls():
	$OnScreenControls/DriveLeft.visible = false


func hide_drive_right_controls():
	$OnScreenControls/DriveRight.visible = false


func show_drill_controls():
	$OnScreenControls/Drill.visible = true


func hide_drill_controls():
	$OnScreenControls/Drill.visible = false


func start():
	points = []
	tip.visible = true
	tip.set_physics_process(true)
	audio_start.play()


func stop():
	tip.set_physics_process(false)
	audio_loop.stop()
	audio_stop.play()


func toggle():
	tip.toggle()


func _on_body_entered(body: Node) -> void:
	_on_tip_collision(body)


func _on_area_entered(area: Area2D) -> void:
	_on_tip_collision(area)


func _on_tip_collision(other: Node) -> void:
	if "Obstacle" in other.get_groups():
		self.emit_signal("hit_obstacle", other)

	if "Target" in other.get_groups():
		self.emit_signal("hit_target", other)


func _on_audio_start_finished() -> void:
	audio_loop.play()
