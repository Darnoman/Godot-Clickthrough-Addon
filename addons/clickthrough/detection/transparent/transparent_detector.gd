#region Header
#01. tool

#02. class_name

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
@onready var clickthrough: Clickthrough = get_parent()

var clickability = false;
var prev_clickability = clickability;
#-----------------------------------------------------------
#09. methods
#-----------------------------------------------------------
func _ready() -> void:
    pass

func _physics_process(delta: float) -> void:
    detect_passthrough()
    if (prev_clickability != clickability):
        clickthrough.set_clickability(clickability)
        prev_clickability = clickability
    pass

func detect_passthrough() -> void:
    var viewport = get_viewport()

    var img = viewport.get_texture().get_image()
    var rect = viewport.get_visible_rect()

    var mousePosition = viewport.get_mouse_position()
    if (mousePosition.x < 0 || mousePosition.y < 0 || mousePosition.x > rect.size.x || mousePosition.y > rect.size.y): return;
    var viewX = mousePosition.x + rect.position.x
    var viewY = mousePosition.y + rect.position.y

    var x = img.get_size().x * viewX / rect.size.x
    var y = img.get_size().y * viewY / rect.size.y

    if (x < img.get_size().x && y < img.get_size().y):
        var pixel = img.get_pixel(x, y)
        clickability = pixel.a > 0
#-----------------------------------------------------------
#10. signal methods
#-----------------------------------------------------------

#endregion