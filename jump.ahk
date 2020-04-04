/*	Rapid Jumper
	Written by Mexon
	On 03.14.17
	
	Sends jump (spacebar) rapidly while held
	Home suspends it
*/

#SINGLEINSTANCE FORCE

HOME::SUSPEND

$space::
{
  while GetKeyState("Space","P")
  {
    Send, {Space down}
    Sleep, 10
    Send, {Space up}
    Sleep, 40  ;every 1 miliseconds
  }
}