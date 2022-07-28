class_name Defeat
extends CanvasLayer


func show():
	$Panel.visible = true
	$AudioStreamPlayer.play()


func hide():
	$Panel.visible = false
