#if TOOLS
using Godot;
using System;

[Tool]
public partial class clickthrough : EditorPlugin
{
	string AutoloadName = "Clickthrough";
	public override void _EnterTree()
	{
		// Initialization of the plugin goes here.
		// AddAutoloadSingleton(AutoloadName, "res://addons/clickthrough/autoloads/clickthrough_gdscript/clickthrough_gdscript.tscn");
	}

	public override void _ExitTree()
	{
		// Clean-up of the plugin goes here.
		// RemoveAutoloadSingleton(AutoloadName);
	}
}
#endif
