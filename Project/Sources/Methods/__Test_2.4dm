//%attributes = {}

__Test



C_LONGINT:C283($winRef; $processNumber)
$winRef:=Frontmost window:C447
$processNumber:=Window process:C446($winRef)

If ($processNumber>0)
	BRING TO FRONT:C326($processNumber)
	SET TEXT TO PASTEBOARD:C523("test\r")
	
	//POST KEY(Character code("a"); Command key mask; $processNumber)
	POST KEY:C465(Character code:C91("a"); Command key mask:K16:1; $processNumber)
	POST KEY:C465(Up arrow key:K12:18; $processNumber)
	POST KEY:C465(Character code:C91("v"); Command key mask:K16:1; $processNumber)
	
End if 
