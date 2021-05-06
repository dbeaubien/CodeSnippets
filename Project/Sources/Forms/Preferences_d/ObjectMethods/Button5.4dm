Case of 
	: (FORM Event:C1606.code=On Load:K2:1)
		var $filePath : Text
		$filePath:=KeyValuePairs_GetFilePath
		Form:C1466.keyValueFilePath:=$filePath
		
		If (Test path name:C476($filePath)=Is a document:K24:1)
			OBJECT SET TITLE:C194(*; "KeyValueFilePath"; $filePath)
		Else 
			OBJECT SET TITLE:C194(*; "KeyValueFilePath"; "There are no stored key/value pairs yet. \rCreate a key/value to create the file.")
			OBJECT SET RGB COLORS:C628(*; "KeyValueFilePath"; 0x00FF0000; "transparent")
			OBJECT SET FONT STYLE:C166(*; "KeyValueFilePath"; Bold and Italic:K14:9)
			OBJECT SET ENABLED:C1123(Self:C308->; False:C215)
		End if 
		
	: (FORM Event:C1606.code=On Clicked:K2:4)
		SHOW ON DISK:C922(Form:C1466.keyValueFilePath; *)
		
		
End case 
