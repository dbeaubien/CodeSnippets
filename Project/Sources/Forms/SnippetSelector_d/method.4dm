
Case of 
	: (FORM Event:C1606.code=On Load:K2:1)
		SET TIMER:C645(15)  // every 1/4 second
		Form:C1466.windowTypeFinder:=cs:C1710.WindowTypeFinder.new()
		Form:C1466.designProcessId:=Process number:C372("Design process")
		Form:C1466.frontDevWindow:=New object:C1471
		Form:C1466.frontDevWindow.refId:=0
		Form:C1466.frontDevWindow.type:=""
		
		Form:C1466.snippetController:=cs:C1710.SnippetController.new()
		Form:C1466.snippetController.LoadFromDisk("someBogusPath")
		Form:C1466.snippetFilteredList:=Form:C1466.snippetController.GetSnippetListByType("@")
		Form:C1466.selectedSnippet:=Null:C1517
		
		
	: (FORM Event:C1606.code=On Timer:K2:25)
		var $frontWinRef : Integer
		$frontWinRef:=Frontmost window:C447
		Case of 
			: (Form:C1466.frontDevWindow.refId=$frontWinRef)  // nothing to do
			: (Form:C1466.designProcessId#Window process:C446($frontWinRef))  // not a designer window
				Form:C1466.frontDevWindow.refId:=0
				Form:C1466.frontDevWindow.type:=""
				OBJECT SET TITLE:C194(*; "Header1"; "Snippets Unsupported")
				OBJECT SET TITLE:C194(*; "windowTitle"; "")
				
			: (Form:C1466.frontDevWindow.refId#$frontWinRef)
				Form:C1466.frontDevWindow.refId:=$frontWinRef
				Form:C1466.frontDevWindow.type:=Form:C1466.windowTypeFinder.GetTypeForWindow($frontWinRef)
				OBJECT SET TITLE:C194(*; "windowTitle"; Get window title:C450($frontWinRef))
				
				If (Form:C1466.frontDevWindow.type#"not supported")
					Form:C1466.snippetFilteredList:=Form:C1466.snippetController.GetSnippetListByType(Form:C1466.frontDevWindow.type)
					OBJECT SET TITLE:C194(*; "Header1"; Form:C1466.frontDevWindow.type+" Snippets")
				Else 
					Form:C1466.snippetFilteredList:=Form:C1466.snippetController.GetSnippetListByType("unsupported")
					OBJECT SET TITLE:C194(*; "Header1"; "Snippets Unsupported")
				End if 
		End case 
		
End case 