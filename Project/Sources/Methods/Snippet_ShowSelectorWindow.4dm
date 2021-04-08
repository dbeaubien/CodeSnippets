//%attributes = {"invisible":true,"shared":true}
C_LONGINT:C283($winRef)
$winRef:=Open form window:C675("SnippetSelector_d"\
; 0-Palette form window:K39:9\
; On the left:K39:2; Vertically centered:K39:4\
; *)

SET WINDOW TITLE:C213("Snippets"; $winRef)

C_OBJECT:C1216($formObj)
$formObj:=New object:C1471
$formObj.windowRef:=$winRef

DIALOG:C40("SnippetSelector_d"; $formObj)

CLOSE WINDOW:C154($winRef)