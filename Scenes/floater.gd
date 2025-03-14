extends Marker2D

var initial_position:Vector2 = global_position
var float_position:Vector2 = global_position
@export var float_speed:float = .1
@export var float_radius:float = 1
var tween:Tween
var test:Signal

func _ready() -> void:
	handle_floating()
	
func handle_floating():
	#print('floating')
	tween = get_tree().create_tween().set_trans(Tween.TRANS_QUAD)
	tween.tween_property(self, "position",  generate_float_position(), float_speed)
	tween.tween_callback(handle_floating)
	return

func generate_float_position() -> Vector2:
	return initial_position + _random_inside_unit_circle() * float_radius

func _random_inside_unit_circle() -> Vector2:
	var theta : float = randf() * 2 * PI
	return Vector2(cos(theta), sin(theta)) * sqrt(randf())
