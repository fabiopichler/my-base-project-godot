extends Node


func _ready() -> void:
	Scene.init(self, $MainSceneDisplay, $MarginContainerFade, $MarginContainerFade/ColorRectFade)
	#Scene.load_scene("scene_game_map")
	Scene.load_scene("scene_intro")
