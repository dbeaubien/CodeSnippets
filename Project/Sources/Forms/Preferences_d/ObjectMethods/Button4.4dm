Case of 
	: (FORM Event:C1606.code=On Load:K2:1)
		var $filePath : Text
		var $snippetController : cs:C1710.SnippetController
		$snippetController:=cs:C1710.SnippetController.new()
		$filePath:=$snippetController.GetFilePath()
		Form:C1466.snippetFilePath:=$filePath
		
		If (Test path name:C476($filePath)=Is a document:K24:1)
			OBJECT SET TITLE:C194(*; "SnippetsFolderPath"; $filePath)
		Else 
			OBJECT SET TITLE:C194(*; "SnippetsFolderPath"; "There are no stored snippets yet, the defaults are still be used. \rCreate/modify a snippet to create the file.")
			OBJECT SET RGB COLORS:C628(*; "SnippetsFolderPath"; 0x00FF0000; "transparent")
			OBJECT SET FONT STYLE:C166(*; "SnippetsFolderPath"; Bold and Italic:K14:9)
			OBJECT SET ENABLED:C1123(Self:C308->; False:C215)
		End if 
		
		
	: (FORM Event:C1606.code=On Clicked:K2:4)
		SHOW ON DISK:C922(Form:C1466.snippetFilePath; *)
		
End case 
