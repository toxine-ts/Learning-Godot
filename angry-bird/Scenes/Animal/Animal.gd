class_name Animal

extends RigidBody2D
const CUP = preload("uid://qi4gtmskd0ak")

@onready var launch_sound: AudioStreamPlayer = $LaunchSound
@onready var kick_sound: AudioStreamPlayer = $KickSound

@onready var arrow: Sprite2D = $Arrow
@onready var label: Label = $Label
@onready var strech_sound: AudioStreamPlayer = $StrechSound

const DRAG_LIM_MAX: Vector2 = Vector2(0, 60)
const DRAG_LIM_MIN: Vector2 = Vector2(-60, 0)
const IMPULST: float = 25.0
const IMPULSE_MAX: float = 2000.0

var _start_position: Vector2 = Vector2.ZERO
var _drage_start: Vector2 = Vector2.ZERO
var _drage_vector: Vector2 = Vector2.ZERO
var _is_draging: bool = false
var _arrow_scale_x: float = 0.0

	
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_released("drag") and _is_draging:
		call_deferred("handle_drag_release")

func _ready() -> void:
	_start_position = position
	_arrow_scale_x = arrow.scale.x

func _process(_delta: float) -> void:
	pass
	#var debug_str: String = "Freeze: %s\nContact count: %d\nSleeping: %s" % [
		#freeze,
		#get_contact_count(),
		#sleeping
	#]
	#debug_str += "is_dragging: %s\n _drage_start: %.0f, %.0f" % [
		#_is_draging, _drage_start.x, _drage_start.y
	#]
	#debug_str += "_drage_vector: %.0f, %.0f" % [
	 #_drage_vector.x, _drage_vector.y
	#]
	#debug_str += "Impulse: %.0f, %.0f" % [
	 #calculate_impulse().x, calculate_impulse().y
	#]
	#label.text = debug_str
	
func _physics_process(_delta: float) -> void:
	if _is_draging: handle_dragging()

func start_draging() -> void:
	_is_draging = true
	_drage_start = get_global_mouse_position()

func handle_dragging() -> void:
	var new_dragged_vector: Vector2 = get_global_mouse_position() - _drage_start
	new_dragged_vector = new_dragged_vector.clamp(DRAG_LIM_MIN, DRAG_LIM_MAX)
	var diff: Vector2 = new_dragged_vector - _drage_vector
	if diff.length() > 1 and !strech_sound.playing:
		strech_sound.play()
	_drage_vector = new_dragged_vector
	position = _drage_vector + _start_position
	scale_arrow()

func calculate_impulse() -> Vector2:
	return _drage_vector * IMPULST * -1

func handle_drag_release() -> void:
	SignalHub.on_emit_attempt_made()
	launch_sound.play()
	arrow.hide()
	_is_draging = false
	freeze = false
	apply_central_impulse(calculate_impulse())

func scale_arrow() -> void:
	var imp_len: float = calculate_impulse().length()
	var perc: float = clamp(imp_len / IMPULSE_MAX, 0.0, 1.0)
	print("perc %s" % [perc])
	arrow.scale.x = lerpf(_arrow_scale_x, _arrow_scale_x * 2, perc)
	arrow.rotation = (_start_position - position).angle()

func _on_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event.is_action_pressed("drag"):
		input_event.disconnect(_on_input_event)
		arrow.show()
		start_draging()

func animal_die() -> void:
	queue_free()
	SignalHub.on_emit_animal_died()


func _on_body_entered(_body: Node) -> void:
	if !kick_sound.playing:
		kick_sound.play()


func _on_sleeping_state_changed() -> void:
	if sleeping:
		for body in get_colliding_bodies():
			if body is Cup: body.die()
		animal_die()
