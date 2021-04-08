Case of 
	: (Not:C34(FORM Event:C1606.code=On After Keystroke:K2:26))
		// do nothing
	: (Get edited text:C655#"") & (Form:C1466.snippet#"") & (Form:C1466.atLeastOneCheckBoxChecked)
		OBJECT SET ENABLED:C1123(*; "buttonSave"; True:C214)
	Else 
		OBJECT SET ENABLED:C1123(*; "buttonSave"; False:C215)
End case 