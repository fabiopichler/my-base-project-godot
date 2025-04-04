extends MeshInstance3D


@export_group("Properties")
@export var to_map: String = ""


func _on_area_3d_body_entered(body: Node3D) -> void:
	GameMap.load_map(to_map)
