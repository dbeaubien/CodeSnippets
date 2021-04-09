//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
// Snippet_SetKeyValue (key, value)
//
// DESCRIPTION
//   The host structure can use this to define custom
//   values for a certain key term.
//   When a snippet is used then any occurances of {{key}}
//   is replaced with the value provided.
//
var $1; $key : Text
var $2; $value : Text
// ----------------------------------------------------
// HISTORY
//   Created by: Dani Beaubien (04/08/2021)
// ----------------------------------------------------
ASSERT:C1129(Count parameters:C259=2)
$key:=$1
$value:=$2

If (Storage:C1525.keyValuePairs=Null:C1517)
	Use (Storage:C1525)
		Storage:C1525.keyValuePairs:=New shared object:C1526
	End use 
End if 

var $keyValuePairs : Object
$keyValuePairs:=Storage:C1525.keyValuePairs
Use ($keyValuePairs)
	$keyValuePairs[$key]:=$value
End use 