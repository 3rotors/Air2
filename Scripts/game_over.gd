extends Control

func _ready() -> void:
	hide()

func resume():
	get_tree().paused = false

func _on_restart_pressed() -> void:
	resume()
	Global.update_highscore()
	get_tree().reload_current_scene()

func _on_main_menu_pressed() -> void:
	resume()
	Global.update_highscore()
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")

func _on_player_health_depeleted() -> void:
	get_tree().paused = true
	show()
