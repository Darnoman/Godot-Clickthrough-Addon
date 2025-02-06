#region Header
#01. tool

#02. class_name

#03. extends
extends Area2D
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
@onready var clickthrough: Clickthrough = get_parent()
var active_areas = 0;
#-----------------------------------------------------------
#09. methods
#-----------------------------------------------------------
func _ready() -> void:
	area_entered.connect(_on_area_entered)
	area_exited.connect(_on_area_exited)
	pass

func _physics_process(delta: float) -> void:
	global_position = get_global_mouse_position()
	pass
#-----------------------------------------------------------
#10. signal methods
#-----------------------------------------------------------

func _on_area_entered(area: Area2D) -> void:
	active_areas += 1
	clickthrough.set_clickability(true)
	pass

func _on_area_exited(area: Area2D) -> void:
	active_areas -= 1
	if active_areas <= 0:
		clickthrough.set_clickability(false)
	pass
#endregion