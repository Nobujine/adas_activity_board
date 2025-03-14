extends Node2D

var original_scale = scale
var has_mouse:bool = false
const SPEED:int = 50
var initial_offset: Vector2
var initial_rotation:float = global_rotation
var position_difference: Vector2
var initial_scale:Vector2 = scale
var rotation_tween:Tween
var scale_tween:Tween

func _on_area_2d_mouse_entered() -> void:
	scale = original_scale * Vector2(1.05, 1.05)
	has_mouse = true
	pass # Replace with function body.


func _on_area_2d_mouse_exited() -> void:
	#scale = original_scale
	has_mouse = false
	pass # Replace with function body.

var held_state:bool = false
func _process(_delta):
	if has_mouse and Input.is_action_pressed("left_click"):
		held_state = true
		if rotation_tween or scale_tween:
			rotation_tween.kill()
			scale_tween.kill()
		rotate(get_angle_to(get_global_mouse_position())-PI/2)
		position_difference = global_position - get_global_mouse_position()
		scale.y = (global_position.distance_to(get_global_mouse_position())) / $Sprite.texture.get_height()
	elif Input.is_action_just_released("left_click"):
		rotation_tween = get_tree().create_tween().set_trans(Tween.TRANS_ELASTIC).set_ease(Tween.EASE_OUT)
		scale_tween = get_tree().create_tween().set_trans(Tween.TRANS_ELASTIC).set_ease(Tween.EASE_OUT)
		rotation_tween.tween_property(self, 'rotation', initial_rotation, 2)
		scale_tween.tween_property(self,'scale', initial_scale, 1)

		# scale.y = lerp(scale.y, initial_scale.y, .1)
