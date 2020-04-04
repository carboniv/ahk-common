/*	At Will Hexadecimal Converter
	Written by Mexon
	On 4.3.20
	
	Alt+H to bring up the gui
	default converts to hex
	prefix 0x to convert to ascii
*/
#singleinstance force

;#Include %A_WorkingDir%\lib\stringDecYieldHex.ahk
;Include %A_WorkingDir%\lib\stringHexYieldDec.ahk

!H::
	Gui, Destroy
	Gui, Add, Text,, String to convert:

	Gui, Add, Edit, vString ;ym  ; The ym option starts a new column of controls. vString sets up a var called String

	Gui, Add, Button, default, OK  ; The label ButtonOK (if it exists) will be run when the button is pressed. sets up a button call ButtonHex

	Gui, Show,, AtWillHexer
	return

GuiClose:
ButtonOK:
Gui, Submit  ; Save the input from the user to each control's associated variable.

isHex := (instr(string, "0x")>0)
ret := (isHex ? stringHexYieldDec(String) : stringDecYieldHex(String, 0, 8))
Clipboard := ret
String := ""
ToolTip % "Copied " . (isHex ? "Dec" : "Hex") . " " . ret
SetTimer, RemoveToolTip, 5000
return

RemoveToolTip:
SetTimer, RemoveToolTip, Off
ToolTip
return

stringDecYieldHex(string, prefix, length) {
	
	chk := string
	ret := ""
	form := "{:" . (prefix ? "#" : "") . 0 . (prefix ? length+2 : length) . "x}" ;designates proper form
	while (chk != "") {
		spaceAt := instr(chk, " ") ;discovers space
		if(spaceAt) {
			slice := substr(chk, 1, spaceAt-1) ;items before space
			chk := substr(chk, spaceAt+1) ;skips space to parse
		}
		else{
			slice := chk ;end of parse
			chk := ""
		}
		
		slice := slice , slice += 0 ;makes slice a number
		
		ret .= format(form, slice) . " " ;appends to slice
	}
	
	ret := substr(ret,1, -1) ;clips end
	return ret
}

stringHexYieldDec(string) {
	ret := ""
	chk := string
	
	while (chk != "") {
		spaceAt := instr(chk, " ") ;discovers space
		if(spaceAt) {
			slice := substr(chk, 1, spaceAt-1) ;items before space
			chk := substr(chk, spaceAt+1) ;skips space to parse
		}
		else{
			slice := chk ;end of parse
			chk := ""
		}
		
		if(!instr(slice, "0x")) { ;checks if value has prefix
			slice := "0x" . slice
		}
		
		slice := slice , slice += 0 ;makes slice a number
		
		ret .= slice . " " ;appends to slice
	}
	
	ret := substr(ret,1, -1) ;clips end
	return ret
}
