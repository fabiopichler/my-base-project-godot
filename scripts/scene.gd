extends Node


var main_scene = null
var scene_instance: Node = null


func init(_main_scene):
	main_scene = _main_scene


func load_scene(scene_name : String):
	unload_scene()
	
	var scene_path := "res://scenes/%s.tscn" % scene_name
	var scene_resource := load(scene_path)
	
	assert(scene_resource)
	
	if scene_resource:
		scene_instance = scene_resource.instantiate()
		main_scene.add_child(scene_instance)


func unload_scene():
	if is_instance_valid(scene_instance):
		scene_instance.queue_free()
		
	scene_instance = null
