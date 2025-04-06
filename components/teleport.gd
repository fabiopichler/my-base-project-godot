extends MeshInstance3D


@export var to_map: String = ""


@export_group("Fade")
@export var fade: Scene.Fade = Scene.Fade.NORMAL
@export var fade_duration: float = 0.25


func _on_area_3d_body_entered(body: Node3D) -> void:
	if to_map.is_empty():
		return
	
	await Scene.fade_out(fade, fade_duration)
	GameMap.load_map(to_map)
	await Scene.fade_in(fade, fade_duration)
