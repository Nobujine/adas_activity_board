extends Node2D

var original_scale = scale
var has_mouse:bool = false
const SPEED:int = 50
var initial_offset: Vector2
var initial_rotation:float = global_rotation
var position_difference: Vector2
var initial_scale:Vector2 = scale

func _on_area_2d_mouse_entered() -> void:
	scale = original_scale * Vector2(1.05, 1.05)
	has_mouse = true
	pass # Replace with function body.


func _on_area_2d_mouse_exited() -> void:
	#scale = original_scale
	has_mouse = false
	pass # Replace with function body.

func _process(delta):
	#if Input.is_action_just_pressed('left_click'):
		#initial_offset = get_global_mouse_position() - global_position
		#print(global_rotation)
	if has_mouse and Input.is_action_pressed("left_click"):
		rotate(get_angle_to(get_global_mouse_position())-PI/2)
		position_difference = global_position - get_global_mouse_position()
		scale.y = (global_position.distance_to(get_global_mouse_position())) / $Sprite.texture.get_height()
	else:
		global_rotation = lerp_angle(global_rotation, initial_rotation, .1)
		scale.y = lerp(scale.y, initial_scale.y, .1)
