extends Camera2D

@export var keyboard_speed = 100
@export var mouse_speed = 1
@export var zoom_speed = 0.5

var capturing_mouse = false;
var newZoom = 1.0

func _input(event):
	if event is InputEventMouseMotion:
		if capturing_mouse:
			position += event.relative * mouse_speed

	if event is InputEventMouseButton:
		if event.button_index == 4 or event.button_index == 5:
			if event.pressed:
				newZoom = clamp(zoom.x + ( - zoom_speed if event.button_index != 4 else zoom_speed), 0.1, 10)

		if event.button_index == 3:
			if event.pressed and not capturing_mouse:
				Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
				capturing_mouse = true
			elif !event.pressed and capturing_mouse:
				Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
				capturing_mouse = false

func _process(delta):
	var input_dir = Input.get_vector("move_left", "move_right", "move_up", "move_down");

	position += input_dir * keyboard_speed * delta
	zoom = zoom.lerp(Vector2(newZoom, newZoom), 5 * delta)
