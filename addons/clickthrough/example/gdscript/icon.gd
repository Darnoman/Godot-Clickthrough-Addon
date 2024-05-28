extends Sprite2D

var initial_position = Vector2.ZERO
var initial_mouse_offset = Vector2.ZERO
var is_dragging = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("test"):
		is_dragging = true
		initial_position = global_position
		initial_mouse_offset = get_global_mouse_position()
	
	if is_dragging:
		if Input.is_action_just_released("test"):
			is_dragging = false
		global_position = initial_position + (get_global_mouse_position() - initial_mouse_offset)
	pass