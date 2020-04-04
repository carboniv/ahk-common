/*	Rapid Clicker
	Written by Mexon
	On 03.14.17
	
	Rapidly clicks while lbutton is held
	Middle mouse button suspends script
*/

~Lbutton::

while (GetKeyState("LButton","P")=1)
{
	send {Lbutton down}
	sleep 25
	send {Lbutton up}
	sleep 25
}
return


~Mbutton::
suspend