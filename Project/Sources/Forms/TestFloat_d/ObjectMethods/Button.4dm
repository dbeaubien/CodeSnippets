
C_LONGINT:C283($winRef; $processNumber)
$winRef:=Frontmost window:C447
$processNumber:=Window process:C446($winRef)
SET TEXT TO PASTEBOARD:C523("test\r")

If ($processNumber>0)
	C_LONGINT:C283($left; $top; $right; $vL_WinBottom)
	GET WINDOW RECT:C443($left; $top; $right; $bottom; $winRef)
	SET WINDOW RECT:C444($left; $top; $right; $vL_WinBottom; $winRef)
	
	POST KEY:C465(Character code:C91("a"); Command key mask:K16:1; $processNumber)
	DELAY PROCESS:C323(Current process:C322; 5)
	
	POST KEY:C465(Up arrow key:K12:18; $processNumber)
	DELAY PROCESS:C323(Current process:C322; 5)
	
	POST KEY:C465(Character code:C91("v"); Command key mask:K16:1; $processNumber)
	
	//POST EVENT(Key down event; Character code("a"); Tickcount; 0; 0; Command key mask; $processNumber)
	//POST EVENT(Key down event; Up arrow key; Tickcount+10; 0; 0; 0; $processNumber)
	//POST EVENT(Key down event; Character code("v"); Tickcount+20; 0; 0; Command key mask; $processNumber)  // post a cmd/ctrl-V event
End if 

INVOKE ACTION:C1439