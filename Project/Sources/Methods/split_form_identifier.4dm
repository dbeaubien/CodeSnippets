//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
// SOURCE: https://github.com/miyako/4d-utility-window-bounds

C_TEXT:C284($1; $formIdentifier)
C_OBJECT:C1216($0; $status)

$formIdentifier:=$1

ARRAY LONGINT:C221($pos; 0)
ARRAY LONGINT:C221($len; 0)

If (Match regex:C1019("\\[([^]]+)\\](.+)"; $formIdentifier; 1; $pos; $len))
	
	$status:=New object:C1471
	$status.table:=Substring:C12($formIdentifier; $pos{1}; $len{1})
	$status.form:=Substring:C12($formIdentifier; $pos{2}; $len{2})
	
Else 
	
	$status:=New object:C1471
	$status.table:="{projectForm}"
	$status.form:=$formIdentifier
	
End if 

$0:=$status