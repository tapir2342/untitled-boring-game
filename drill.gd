class_name Drill
extends Node2D

signal hit_obstacle(area2d)
signal hit_target(area2d)

onready var tip := $Tip

var points := PoolVector2Array()


func _draw():
	draw_polyline(points, Color.white, 3.0, true)


func _ready():
	tip.connect("area_entered", self, "_on_tip_collision")
	tip.set_physics_process(false)


func _process(delta):
	points.append($Tip.position)
	update()


func start():
	tip.set_physics_process(true)


func stop():
	tip.set_physics_process(false)


func toggle():
	tip.toggle()


func _on_tip_collision(area: Area2D) -> void:
	if "Obstacle" in area.get_groups():
		self.emit_signal("hit_obstacle", area)

	if "Target" in area.get_groups():
		self.emit_signal("hit_target", area)
