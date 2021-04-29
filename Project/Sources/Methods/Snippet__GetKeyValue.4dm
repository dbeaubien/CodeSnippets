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

Storage_init

var $keyValue : Object
If (Storage:C1525.keyValuePairs.query("key=:1"; $key).length>0)
	$keyValue:=Storage:C1525.keyValuePairs.query("key=:1"; $key)[0]
	
	If ($keyValue#Null:C1517)
		$value:=String:C10($keyValue.value)
	End if 
End if 

$0:=$value