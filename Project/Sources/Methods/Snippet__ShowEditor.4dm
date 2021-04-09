//%attributes = {"invisible":true}
// Snippet__ShowEditor (snippet) : wasUpdated
//
// DESCRIPTION
//   Puts up an editor for the developer to modify
//   the snippet. Returns true if the snippet
//   has been modified.
//
var $1; $snippet : cs:C1710.SnippetModel
var $0; $wasUpdated : Boolean
// ----------------------------------------------------
// HISTORY
//   Created by: Dani Beaubien (04/08/2021)
// ----------------------------------------------------
ASSERT:C1129(Count parameters:C259=1)
$snippet:=$1
$wasUpdated:=$0


var $winRef : Integer
$winRef:=Open form window:C675("SnippetEditor_d"\
; Regular window:K27:1\
; On the left:K39:2; Vertically centered:K39:4\
; *)

SET WINDOW TITLE:C213("Snippet Editor"; $winRef)

var $formObj : Object
$formObj:=New object:C1471

$formObj.name:=$snippet.GetName()
$formObj.snippet:=$snippet.GetSnippet()
$formObj.locationToInsert:=$snippet.GetLocationToApply()
$formObj.limitToWindowTypes:=$snippet.GetListOfPermittedWindowTypes()

DIALOG:C40("SnippetEditor_d"; $formObj)
CLOSE WINDOW:C154($winRef)

If ($formObj.saved)
	var $supportedWindowType : Text
	
	$snippet.SetName($formObj.name)
	$snippet.SetSnippet($formObj.snippet)
	$snippet.SetLocationToApply($formObj.locationToInsert)
	$snippet.ClearPermittedWindowTypes()
	For each ($supportedWindowType; $formObj.limitToWindowTypes)
		$snippet.AddPermitedWindowType($supportedWindowType)
	End for each 
	
	$wasUpdated:=True:C214
End if 

$0:=$wasUpdated