class_name Defeat
extends CanvasLayer


signal retry

onready var _retry_button: Button = $Control/Button


func show():
	$Control.visible = true
	$AudioStreamPlayer.play()
	_retry_button.connect("pressed", self, "_on_retry_pressed")


func hide():
	$Control.visible = false


func _on_retry_pressed() -> void:
	self.emit_signal("retry")
