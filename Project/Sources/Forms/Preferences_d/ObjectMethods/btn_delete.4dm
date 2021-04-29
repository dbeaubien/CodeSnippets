
If (Form:C1466.selectedTag#Null:C1517)
	
	var $index : Integer
	$index:=Form:C1466.keyValuePairs.indexOf(Form:C1466.selectedTag)
	
	CONFIRM:C162("Are you sure you want to remove the \""+Form:C1466.selectedTag.key+"\" tag?"; "Yes"; "Cancel")
	If (OK=1)
		LISTBOX SELECT ROW:C912(*; "tags_lb"; 0; lk remove from selection:K53:3)
		Form:C1466.keyValuePairs:=Form:C1466.keyValuePairs.remove($index; 1)
	End if 
End if 