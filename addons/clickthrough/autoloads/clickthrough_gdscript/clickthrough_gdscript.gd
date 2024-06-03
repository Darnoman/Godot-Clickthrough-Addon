#region Header
#01. tool

#02. class_name
class_name ClickthroughGdscript
#03. extends
extends Node
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
var clickthrough_csharp_packed_script: PackedScene = preload("res://addons/clickthrough/autoloads/clickthrough_csharp/ClickthroughCSharp.tscn")
@onready var clickthrough_csharp = clickthrough_csharp_packed_script.instantiate()
@onready var mouse_detection = clickthrough_csharp.get_node("MouseDetection")

@export var use_default_detection_passthrough: bool = true:
	set(value):
		if value == use_default_detection_passthrough: return
		use_default_detection_passthrough = value
		if mouse_detection == null: return
		mouse_detection.SetUseDefaultDetectPassthrough(value)
		

#-----------------------------------------------------------
#09. methods
#-----------------------------------------------------------
func _ready() -> void:
	add_child(clickthrough_csharp)
	mouse_detection.SetUseDefaultDetectPassthrough(use_default_detection_passthrough)
	pass

func set_clickthrough(value: bool) -> void:
	clickthrough_csharp.SetClickthrough(value)
	pass

func set_clickability(value: bool) -> void:
	mouse_detection.SetClickability(value)
	pass
#-----------------------------------------------------------
#10. signal methods
#-----------------------------------------------------------
