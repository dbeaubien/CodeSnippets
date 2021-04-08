Form:C1466.saved:=True:C214

Form:C1466.limitToWindowTypes:=New collection:C1472
If (Form:C1466.appliesToProjectMethods)
	Form:C1466.limitToWindowTypes.push("Method")
End if 
If (Form:C1466.appliesToObjectMethods)
	Form:C1466.limitToWindowTypes.push("Object Method")
End if 
If (Form:C1466.appliesToFormMethods)
	Form:C1466.limitToWindowTypes.push("Form Method")
End if 
If (Form:C1466.appliesToDatabaseMethods)
	Form:C1466.limitToWindowTypes.push("Database Method")
End if 
If (Form:C1466.appliesToTriggerMethods)
	Form:C1466.limitToWindowTypes.push("Trigger")
End if 
If (Form:C1466.appliesToClassMethods)
	Form:C1466.limitToWindowTypes.push("Class")
End if 

ACCEPT:C269