//%attributes = {}
C_LONGINT:C283($winRef)
$winRef:=Open form window:C675("SnippetEditor_d"\
; Regular window:K27:1\
; On the left:K39:2; Vertically centered:K39:4\
; *)

SET WINDOW TITLE:C213("Snippet Editor"; $winRef)

C_OBJECT:C1216($formObj)
$formObj:=New object:C1471

$formObj.name:="test name"
$formObj.snippet:="test name"
$formObj.locationToInsert:="top"

DIALOG:C40("SnippetEditor_d"; $formObj)
CLOSE WINDOW:C154($winRef)

If ($formObj.saved)
	
End if 