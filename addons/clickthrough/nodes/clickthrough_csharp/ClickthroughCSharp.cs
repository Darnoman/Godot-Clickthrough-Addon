using Godot;
using System;
using System.Runtime.InteropServices;

public partial class ClickthroughCSharp : Node
{
	// SetWindowLong() modifies a specific flag value associated with a window.
	// We pass the window handle, the index of the property, and the flags the property will have
	[DllImport("user32.dll")]
	private static extern int SetWindowLong(IntPtr hWnd, int nIndex, uint dwNewLong);
	
	// This is the index of the property we want to modify
	private const int GwlExStyle = -20;
	
	// The flags we want to set
	private const uint WsExLayered = 0x00080000;			// Makes the window "layered"
	private const uint WsExTransparent = 0x00000020;		// Makes the window "clickable through"
	// check https://learn.microsoft.com/en-us/windows/win32/winmsg/extended-window-styles 

	// This is the variable containing the window handle
	private IntPtr _hWnd;

	public override void _Ready()
	{
		// We store the window handle
		_hWnd = (IntPtr)DisplayServer.WindowGetNativeHandle(DisplayServer.HandleType.WindowHandle, GetWindow().GetWindowId());
		
		// We can set the properties already from here
		SetWindowLong(_hWnd, GwlExStyle, WsExLayered );

		SetClickthrough(true);
	}
	
	// This function sets the property of being clickable or not, we will call this function from the mouse detection 
	public void SetClickthrough(bool clickthrough)
	{
		if (clickthrough)
		{
			// We set the window as layered and click-through
			SetWindowLong(_hWnd, GwlExStyle,   WsExLayered | WsExTransparent);
		}
		else
		{
			// We only set the window as layered, so it will be clickable
			SetWindowLong(_hWnd, GwlExStyle, WsExLayered);
		}
	}
}
