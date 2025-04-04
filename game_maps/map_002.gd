extends Node3D


func _ready() -> void:
	GameMap.player.global_position = get_node("Marker3D").global_position
