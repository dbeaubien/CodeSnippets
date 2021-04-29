Case of 
		
	: (FORM Event:C1606.code=On After Keystroke:K2:26)
		OBJECT SET TITLE:C194(*; "note"; "Anytime the tag appears in a snippet as {{"+Get edited text:C655+"}} it will be replaced with the above value.")
		
	: (FORM Event:C1606.code=On Data Change:K2:15) & (Form:C1466.selectedTag.key="")
		BEEP:C151
		Form:C1466.selectedTag.key:="tag"
		GOTO OBJECT:C206(*; "selectedTag_Key")
		
	: (FORM Event:C1606.code=On Data Change:K2:15) & (Form:C1466.selectedTag.key#"")
		OBJECT SET TITLE:C194(*; "note"; "Anytime the tag appears in a snippet as {{"+Form:C1466.selectedTag.key+"}} it will be replaced with the above value.")
		
End case 
