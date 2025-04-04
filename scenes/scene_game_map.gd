extends Node


@onready var hud : Control = $HUD
@onready var menu : Control = $Menu
var _show_menu: bool = false


func _ready() -> void:
	menu.hide()
	
	GameMap.scene_game_map = self
	GameMap.main_3d = $Main3D
	GameMap.player = $Main3D/Player
	
	GameMap.load_map("map_001")


func _input(event):
	if event.is_action_pressed("ui_cancel"):
		show_menu(not _show_menu)


func _on_resume_button_down() -> void:
	show_menu(false)


func _on_options_button_down() -> void:
	pass


func _on_main_menu_button_down() -> void:
	Scene.load_scene("scene_main_menu")


func _on_quit_game_button_down() -> void:
	get_tree().quit()


func show_menu(show):
	_show_menu = show
	
	if show:
		hud.hide()
		menu.show()
		$Menu/CenterContainer/VBoxContainer/Resume.grab_focus()
	else:
		hud.show()
		menu.hide()
