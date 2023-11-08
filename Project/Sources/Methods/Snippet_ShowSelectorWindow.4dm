//%attributes = {"shared":true}
// Snippet_ShowSelectorWindow ()
//
// DESCRIPTION
//   Puts up an editor for the developer to modify
//   the snippet. Returns true if the snippet
//   has been modified.
//
// ----------------------------------------------------
// HISTORY
//   Created by: Dani Beaubien (04/03/2021)
// ----------------------------------------------------
ASSERT:C1129(Count parameters:C259=0)

var $processId : Integer
$processId:=Process number:C372(Current method name:C684)

Case of 
	: ($processId=0)
		$processId:=New process:C317(Current method name:C684; 0; Current method name:C684)
		
	: ($processId#0) & (Not:C34($processId=Current process:C322))
		// nothing to do
		
	Else 
		KeyValuePairs_LoadFromDisk
		
		var $Bounds : Object
		$Bounds:=Bounds
		$frames:=$Bounds.get("SnippetSelector_d")
		
		var $winRef : Integer
		If ($frames.x=0) & ($frames.y=0)
			$winRef:=Open form window:C675("SnippetSelector_d"\
				; Palette form window:K39:9\
				; On the left:K39:2; Vertically centered:K39:4\
				; *)
		Else 
			$winRef:=Open form window:C675("SnippetSelector_d"\
				; Palette form window:K39:9\
				; $frames.x; $frames.y)
			
			SET WINDOW RECT:C444($frames.x; $frames.y\
				; $frames.x+$frames.width; $frames.y+$frames.height)
		End if 
		
		SET WINDOW TITLE:C213("Snippets"; $winRef)
		
		var $formObj : Object
		$formObj:=New object:C1471
		$formObj.windowRef:=$winRef
		
		DIALOG:C40("SnippetSelector_d"; $formObj)
		
		CLOSE WINDOW:C154($winRef)
End case 