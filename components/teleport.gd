extends MeshInstance3D


enum Fade {
	Normal,
	White,
	None
}


@export var to_map: String = ""


@export_group("Fade")
@export var fade: Fade = Fade.Normal
@export var fade_duration: float = 0.25


func _on_area_3d_body_entered(body: Node3D) -> void:
	if to_map.is_empty():
		return
	
	if fade == Fade.Normal:
		await Scene.fade_out(fade_duration)
	
	GameMap.load_map(to_map)
	
	if fade == Fade.Normal:
		await Scene.fade_in(fade_duration)
