class_name Victory
extends CanvasLayer


func show():
	$Control.visible = true
	$AudioStreamPlayer.play()
	$Panel/Particles2D.emitting = true


func hide():
	$Control.visible = false
