extends Control


func _ready() -> void:
	$CenterContainer/VBoxContainer/NewGame.grab_focus()


func _on_new_game_button_down() -> void:
	Scene.load_scene("scene_game_map")


func _on_load_game_button_down() -> void:
	pass


func _on_options_button_down() -> void:
	pass


func _on_exit_game_button_down() -> void:
	get_tree().quit()
