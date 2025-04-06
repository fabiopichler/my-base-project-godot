extends Node


var scene_game_map = null
var main_3d : Node3D = null
var player: Node3D = null
var map_instance : Node3D = null


func load_map(map_name : String):
	unload_map()
	
	var map_path := "res://game_maps/%s.tscn" % map_name
	var map_resource := load(map_path)
	
	assert(map_resource)
	
	if map_resource:
		map_instance = map_resource.instantiate()
		main_3d.add_child(map_instance)


func unload_map():
	if is_instance_valid(map_instance):
		map_instance.queue_free()
	
	map_instance = null
