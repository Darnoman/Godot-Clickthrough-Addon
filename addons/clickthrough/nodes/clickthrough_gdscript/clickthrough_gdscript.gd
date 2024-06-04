#region Header
#01. tool

#02. class_name
class_name Clickthrough
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
@onready var clickthrough_csharp_packed_script: PackedScene = preload("res://addons/clickthrough/nodes/clickthrough_csharp/ClickthroughCSharp.tscn")
@onready var clickthrough_csharp = clickthrough_csharp_packed_script.instantiate()
#-----------------------------------------------------------
#09. methods
#-----------------------------------------------------------
func _ready() -> void:
    add_child(clickthrough_csharp)
    pass

func set_clickability(clickability: bool) -> void:
    clickthrough_csharp.SetClickthrough(!clickability)

#-----------------------------------------------------------
#10. signal methods
#-----------------------------------------------------------
