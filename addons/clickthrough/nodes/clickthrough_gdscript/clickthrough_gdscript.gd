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
@export var transparent_bg: bool = true
@export var window_mode: DisplayServer.WindowMode = DisplayServer.WindowMode.WINDOW_MODE_WINDOWED
@export var always_on_top: bool = true
@export var unfocusable: bool = true
@export var unresizable: bool = true
@export var borderless: bool = true


@onready var clickthrough_csharp_packed_script: PackedScene = preload("res://addons/clickthrough/nodes/clickthrough_csharp/ClickthroughCSharp.tscn")
@onready var clickthrough_csharp = clickthrough_csharp_packed_script.instantiate()
#-----------------------------------------------------------
#09. methods
#-----------------------------------------------------------
func _ready() -> void:
    DisplayServer.window_set_flag(DisplayServer.WindowFlags.WINDOW_FLAG_TRANSPARENT, transparent_bg, get_window().get_window_id())
    DisplayServer.window_set_flag(DisplayServer.WindowFlags.WINDOW_FLAG_ALWAYS_ON_TOP, always_on_top, get_window().get_window_id())
    if transparent_bg:
        get_window().transparent = true
    
    DisplayServer.window_set_mode(window_mode, get_window().get_window_id())
    DisplayServer.window_set_flag(DisplayServer.WindowFlags.WINDOW_FLAG_RESIZE_DISABLED, unresizable, get_window().get_window_id())
    DisplayServer.window_set_flag(DisplayServer.WindowFlags.WINDOW_FLAG_NO_FOCUS, unfocusable, get_window().get_window_id())
    DisplayServer.window_set_flag(DisplayServer.WindowFlags.WINDOW_FLAG_BORDERLESS, borderless, get_window().get_window_id())

    await get_window().ready
    add_child(clickthrough_csharp)
    get_viewport().size_changed.connect(_on_viewport_size_changed)
    pass

func set_clickability(clickability: bool) -> void:
    clickthrough_csharp.SetClickthrough(!clickability)

#-----------------------------------------------------------
#10. signal methods
#-----------------------------------------------------------
func _on_viewport_size_changed() -> void:
    get_window().borderless = false
    get_window().borderless = borderless