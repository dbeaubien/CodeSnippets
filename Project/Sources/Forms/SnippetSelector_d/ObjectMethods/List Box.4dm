Case of 
	: (FORM Event:C1606.code=On Clicked:K2:4) & (Right click:C712)
		
		C_COLLECTION:C1488($menuContents)
		$menuContents:=New collection:C1472
		If (Form:C1466.selectedSnippet#Null:C1517)
			$menuContents.push("Edit Snippet…")
			$menuContents.push("Duplicate Snippet")
		Else 
			$menuContents.push("(Edit Snippet…")
			$menuContents.push("(Duplicate Snippet")
		End if 
		$menuContents.push("(-")  // line
		$menuContents.push("Add Snippet…")
		$menuContents.push("(-")  // line
		If (Form:C1466.selectedSnippet#Null:C1517)
			$menuContents.push("Delete Snippet")
		Else 
			$menuContents.push("(Delete Snippet")
		End if 
		
		C_LONGINT:C283($selectedItem)
		$selectedItem:=Pop up menu:C542($menuContents.join(";"))
		Case of 
			: ($selectedItem=1)  // Edit Snippet
				HIDE WINDOW:C436(Form:C1466.windowRef)
				If (Snippet__ShowEditor(Form:C1466.selectedSnippet))
					Form:C1466.forceListRefresh:=True:C214
				End if 
				SHOW WINDOW:C435(Form:C1466.windowRef)
				
			: ($selectedItem=2)  // Duplicate Snippet
				var $snippet : cs:C1710.SnippetModel
				$snippet:=Form:C1466.selectedSnippet
				$snippet:=$snippet.copy()
				Form:C1466.snippetController.AddSnippetToList($snippet)
				Form:C1466.forceListRefresh:=True:C214
				
			: ($selectedItem=3)  // line
				
			: ($selectedItem=4)  // Add Snippet
				var $snippet : cs:C1710.SnippetModel
				$snippet:=cs:C1710.SnippetModel.new()
				If (Snippet__ShowEditor($snippet))
					Form:C1466.snippetController.AddSnippetToList($snippet)
					Form:C1466.forceListRefresh:=True:C214
				End if 
				
			: ($selectedItem=5)  // line
				
			: ($selectedItem=6)  // Delete Snippet
				BEEP:C151
				ALERT:C41("not implemented yet")
				
		End case 
		
	: (FORM Event:C1606.code=On Double Clicked:K2:5) & (Form:C1466.selectedSnippet#Null:C1517)
		Form:C1466.snippetController.ApplySnippetToDevWindow(Form:C1466.selectedSnippet)
End case 



