
Case of 
	: (FORM Event:C1606.code=On Load:K2:1)
		Form:C1466.saved:=False:C215
		
		Case of 
			: (Form:C1466.locationToInsert="top")
				Form:C1466.insertTop:=1
				
			: (Form:C1466.locationToInsert="bottom")
				Form:C1466.insertBottom:=1
				
			: (Form:C1466.locationToInsert="cursor")
				Form:C1466.insertCursor:=1
				
			Else 
				Form:C1466.locationToInsert:="cursor"
				Form:C1466.insertCursor:=1
		End case 
		
	: (FORM Event:C1606.code=On Close Box:K2:21)
		Form:C1466.saved:=False:C215
		CANCEL:C270
End case 