
Case of 
	: (FORM Event:C1606.code=On Load:K2:1)
		Form:C1466.saved:=False:C215
		
		Form:C1466.appliesToProjectMethods:=(Form:C1466.limitToWindowTypes.indexOf("Method")>=0)
		Form:C1466.appliesToObjectMethods:=(Form:C1466.limitToWindowTypes.indexOf("Object Method")>=0)
		Form:C1466.appliesToFormMethods:=(Form:C1466.limitToWindowTypes.indexOf("Form Method")>=0)
		Form:C1466.appliesToDatabaseMethods:=(Form:C1466.limitToWindowTypes.indexOf("Database Method")>=0)
		Form:C1466.appliesToTriggerMethods:=(Form:C1466.limitToWindowTypes.indexOf("Trigger")>=0)
		Form:C1466.appliesToClassMethods:=(Form:C1466.limitToWindowTypes.indexOf("Class")>=0)
		
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

Form:C1466.atLeastOneCheckBoxChecked:=Form:C1466.appliesToProjectMethods\
 | Form:C1466.appliesToObjectMethods\
 | Form:C1466.appliesToFormMethods\
 | Form:C1466.appliesToDatabaseMethods\
 | Form:C1466.appliesToTriggerMethods\
 | Form:C1466.appliesToClassMethods

C_BOOLEAN:C305($enableSaveButton)
If (Form:C1466.name#"") & (Form:C1466.snippet#"")
	$enableSaveButton:=Form:C1466.atLeastOneCheckBoxChecked
End if 

OBJECT SET ENABLED:C1123(*; "buttonSave"; $enableSaveButton)
