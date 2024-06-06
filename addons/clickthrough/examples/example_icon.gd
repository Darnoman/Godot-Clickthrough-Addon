#region Header
#01. tool

#02. class_name

#03. extends
extends Sprite2D
#endregion

#region Documentation
#-----------------------------------------------------------
#04. # docstring
## hoge
#-----------------------------------------------------------
#endregion

#region Body
#05. signals
#-----------------------------------------------------------

#-----------------------------------------------------------
#06. enums
#-----------------------------------------------------------

#-----------------------------------------------------------
#08. variables
#-----------------------------------------------------------
var is_dragging = false
var initial_position = Vector2.ZERO
var initial_mouse_position = Vector2.ZERO
#-----------------------------------------------------------
#09. methods
#-----------------------------------------------------------
func _ready() -> void:
	var left_click = InputEventMouseButton.new()
	left_click.button_index = MOUSE_BUTTON_LEFT
	if !InputMap.has_action("click"):
		InputMap.add_action("click")
	InputMap.action_add_event("click", left_click)

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("click") and is_mouse_over():
		is_dragging = true
		initial_position = global_position
		initial_mouse_position = get_global_mouse_position()
	
	if is_dragging:
		if Input.is_action_just_released("click"):
			is_dragging = false
		
		global_position = get_global_mouse_position() - initial_mouse_position + initial_position	

func is_mouse_over() -> bool:
	if get_global_mouse_position().x >= global_position.x - get_rect().size.x / 2 and get_global_mouse_position().x <= global_position.x + get_rect().size.x / 2:
		if get_global_mouse_position().y >= global_position.y - get_rect().size.y / 2 and get_global_mouse_position().y <= global_position.y + get_rect().size.y / 2:
			return true
	return false
#-----------------------------------------------------------
#10. signal methods
#-----------------------------------------------------------
