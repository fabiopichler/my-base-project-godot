extends Node


var main_scene = null
var main_scene_display = null
var color_rect_fade = null
var scene_instance: Node = null


func init(_main_scene, _main_scene_display, _color_rect_fade):
	main_scene = _main_scene
	main_scene_display = _main_scene_display
	color_rect_fade = _color_rect_fade


func load_scene(scene_name : String):
	if is_instance_valid(scene_instance):
		await fade_out()
	
	unload_scene()
	
	var scene_path := "res://scenes/%s.tscn" % scene_name
	var scene_resource := load(scene_path)
	
	assert(scene_resource)
	
	if scene_resource:
		scene_instance = scene_resource.instantiate()
		main_scene_display.add_child(scene_instance)
		
		await fade_in()


func unload_scene():
	if is_instance_valid(scene_instance):
		scene_instance.queue_free()
		
	scene_instance = null


func fade_in(duration: float = 0.25):
	var tween: Tween = main_scene.create_tween().set_parallel(true)
	
	color_rect_fade.visible = true
	color_rect_fade.modulate.a = 1
	
	tween.tween_property(
		color_rect_fade,
		"modulate:a",
		0,
		duration
	)
	
	tween.play()
	await tween.finished
	
	color_rect_fade.visible = false


func fade_out(duration: float = 0.25):
	var tween: Tween = main_scene.create_tween().set_parallel(true)
	
	color_rect_fade.visible = true
	color_rect_fade.modulate.a = 0
	
	tween.tween_property(
		color_rect_fade,
		"modulate:a",
		1,
		duration
	)
	
	tween.play()
	await tween.finished
	
	color_rect_fade.visible = false
