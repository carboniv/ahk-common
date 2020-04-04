/*	Show Image On Top
	Written by Mexon
	On 03.14.17
	
	Loads a transparent image above all windows usful for diagrams and crosshairs
	defaults to crosshairs/crosshair.png
*/

SetWorkingDir, %A_ScriptDir%

#SingleInstance, force

image = crosshairs/crosshair.png ;no quotes cxDragon cxRocketMos
CustomColor := "EEAA99" ;dont change, arbitrary color

Gui, +AlwaysOnTop +Lastfound +ToolWindow -Caption
Gui, +E0x20 ;+HWNDguiID

Gui, Add, Picture, , %image% ;creates gui with specified image

Gui, Color, %CustomColor%	;sets gui seethrough
WinSet, TransColor, %CustomColor% 150	;sets window seethrough

Gui, Show 