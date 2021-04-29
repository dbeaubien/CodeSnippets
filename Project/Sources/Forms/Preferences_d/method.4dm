
Case of 
	: (FORM Event:C1606.code=On Load:K2:1)
		Form:C1466.saved:=False:C215
		Form:C1466.selectedTag:=Null:C1517
		
	: (FORM Event:C1606.code=On Close Box:K2:21)
		Form:C1466.saved:=False:C215
		CANCEL:C270
End case 


var $note : Text
Case of 
	: (Form:C1466.selectedTag=Null:C1517)
		OBJECT SET ENABLED:C1123(*; "btn_delete"; False:C215)
		OBJECT SET ENABLED:C1123(*; "selectedTag_@"; False:C215)
		OBJECT SET RGB COLORS:C628(*; "selectedTag_@"; Foreground color:K23:1; Background color none:K23:10)
		$note:="Click on a tag to edit."
		
	: (Form:C1466.selectedTag.type="code")
		OBJECT SET ENABLED:C1123(*; "btn_delete"; False:C215)
		OBJECT SET ENABLED:C1123(*; "selectedTag_@"; False:C215)
		OBJECT SET RGB COLORS:C628(*; "selectedTag_@"; Foreground color:K23:1; Background color none:K23:10)
		$note:="Anytime the tag appears in a snippet as {{"+Form:C1466.selectedTag.key+"}} it will be replaced with the above value."
		$note:=$note+"\r\r"
		$note:=$note+"The tag is not editable since it was created by the Snippet_SetKeyValue method."
		
	Else 
		OBJECT SET ENABLED:C1123(*; "btn_delete"; True:C214)
		OBJECT SET ENABLED:C1123(*; "selectedTag_@"; True:C214)
		OBJECT SET RGB COLORS:C628(*; "selectedTag_@"; Foreground color:K23:1; 0x00FFFFFF)
		$note:="Anytime the tag appears in a snippet as {{"+Form:C1466.selectedTag.key+"}} it will be replaced with the above value."
End case 
OBJECT SET TITLE:C194(*; "note"; $note)