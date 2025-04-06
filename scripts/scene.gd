extends Node


enum Fade {
	NORMAL,
	WHITE,
	NONE
}


var main_scene = null
var main_scene_display = null
var color_rect_fade: ColorRect = null
var scene_instance: Node = null


func init(_main_scene, _main_scene_display, _color_rect_fade):
	main_scene = _main_scene
	main_scene_display = _main_scene_display
	color_rect_fade = _color_rect_fade


func load_scene(scene_name : String, fade: Fade = Fade.NORMAL, fade_duration: float = 0.25):
	if is_instance_valid(scene_instance):
		await fade_out(fade, fade_duration)
	
	unload_scene()
	
	var scene_path := "res://scenes/%s.tscn" % scene_name
	var scene_resource := load(scene_path)
	
	assert(scene_resource)
	
	if scene_resource:
		scene_instance = scene_resource.instantiate()
		main_scene_display.add_child(scene_instance)
		
		await fade_in(fade, fade_duration)


func unload_scene():
	if is_instance_valid(scene_instance):
		scene_instance.queue_free()
		
	scene_instance = null


func fade_in(fade: Fade = Fade.NORMAL, duration: float = 0.25):
	await make_fade(fade, duration, Color.WHITE, Color.TRANSPARENT)


func fade_out(fade: Fade = Fade.NORMAL, duration: float = 0.25):
	await make_fade(fade, duration, Color.TRANSPARENT, Color.WHITE)


func make_fade(fade: Fade, duration: float, color_in: Color, color_out: Color):
	if fade == Fade.NONE:
		return
	
	if fade == Fade.WHITE:
		color_rect_fade.color = Color.WHITE
	else:
		color_rect_fade.color = Color.BLACK
	
	color_rect_fade.visible = true
	color_rect_fade.modulate = color_in
	
	var tween: Tween = main_scene.create_tween().set_parallel(true)
	
	tween.tween_property(
		color_rect_fade,
		"modulate",
		color_out,
		duration
	)
	
	tween.play()
	await tween.finished
	
	color_rect_fade.visible = false
