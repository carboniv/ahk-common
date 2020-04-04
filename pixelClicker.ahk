/*	Click on Pixel Color Change
	Written by Mexon
	On 03.14.20
	
	Ctrl+Rightclick to watch a pixel position for color change
	Clicks upon color change
*/

SetWorkingDir, %A_ScriptDir%
#SingleInstance, force

tipx := 200
tipy := 200

^RButton::
MouseGetPos, posx, posy
checkx := posx + 15
checky := posy + 15
;MsgBox, The cursor is at X%checkx% Y%checky%.
PixelGetColor, pixelColorInit, checkx, checky
;MsgBox, The PixelColor is %pixelColorInit%
Tooltip, PCI: %pixelColorInit%, %tipx%, %tipy%

loop {
	PixelGetColor, pixelColorTest, checkx, checky
	Tooltip, PCI: %pixelColorInit% vs PCT: %pixelColorTest%, %tipx%, %tipy%
	if(pixelColorInit != pixelColorTest) {
		;Tooltip, clicked on PCI: %pixelColorInit% vs PCT: %pixelColorTest%, %tipx%, %tipy%
			sleep 5
		Click
		
		break
	}
}
Tooltip, clicked on PCI: %pixelColorInit% vs PCT: %pixelColorTest%, %tipx%, %tipy%
sleep 3000

^.::
reload

^/::
ExitApp