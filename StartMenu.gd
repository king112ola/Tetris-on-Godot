extends Node2D

signal transitionaled

const MainScene = preload("res://Main.tscn")


func _on_StartButton_pressed():
	$Transition.transition()


func _on_QuitButton_pressed():
	pass


func _on_Transition_transitionaled():
	
	
	
	get_tree().get_root().add_child(MainScene.instance())
