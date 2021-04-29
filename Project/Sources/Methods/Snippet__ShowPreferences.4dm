//%attributes = {"invisible":true}
// Snippet__ShowPreferences () 
//
// DESCRIPTION
//   Puts up the preferences window.
//
// ----------------------------------------------------
// HISTORY
//   Created by: Dani Beaubien (04/19/2021)
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
		var $winRef : Integer
		$winRef:=Open form window:C675("Preferences_d"\
			; Movable form dialog box:K39:8\
			; Horizontally centered:K39:1; Vertically centered:K39:4\
			; *)
		
		SET WINDOW TITLE:C213("Snippet Preferences"; $winRef)
		
		Storage_init
		
		var $formObj : Object
		$formObj:=New object:C1471
		$formObj.windowRef:=$winRef
		$formObj.keyValuePairs:=Storage:C1525.keyValuePairs.copy()
		
		DIALOG:C40("Preferences_d"; $formObj)
		
		If ($formObj.saved)
			KeyValuePairs_SaveToDisk()
			
			Use (Storage:C1525.keyValuePairs)
				OBJ_CopyToSharedCollection($formObj.keyValuePairs; Storage:C1525.keyValuePairs)
			End use 
		End if 
		
		CLOSE WINDOW:C154($winRef)
End case 
