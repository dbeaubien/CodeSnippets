//%attributes = {"invisible":true,"preemptive":"capable"}
// Snippet__GetKeyValue (key) : value
//
// DESCRIPTION
//   Returns the value for the specified key.
//
var $1; $key : Text
var $0; $value : Text
// ----------------------------------------------------
// HISTORY
//   Created by: Dani Beaubien (04/08/2021)
// ----------------------------------------------------
ASSERT:C1129(Count parameters:C259=1)
$key:=$1
$value:=""

If (Storage:C1525.keyValuePairs#Null:C1517)
	$value:=String:C10(Storage:C1525.keyValuePairs[$key])
End if 

$0:=$value