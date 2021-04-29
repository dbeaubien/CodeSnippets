//%attributes = {"invisible":true,"preemptive":"capable"}
// Snippet__SetKeyValueOfType (key, value, type)
//
// DESCRIPTION
//   The host structure can use this to define custom
//   values for a certain key term.
//   When a snippet is used then any occurances of {{key}}
//   is replaced with the value provided.
//
var $1; $key : Text
var $2; $value : Text
var $3; $type : Text
// ----------------------------------------------------
// HISTORY
//   Created by: Dani Beaubien (04/08/2021)
// ----------------------------------------------------
ASSERT:C1129(Count parameters:C259=3)
$key:=$1
$value:=$2
$type:=$3

Storage_init

var $foundPairs : Collection
$foundPairs:=Storage:C1525.keyValuePairs.query("key=:1"; $key)

var $keyValue : Object
If ($foundPairs.length=0)
	$keyValue:=New shared object:C1526
	Use (Storage:C1525.keyValuePairs)
		Storage:C1525.keyValuePairs.push($keyValue)
	End use 
Else 
	$keyValue:=$foundPairs[0]
End if 

Use ($keyValue)
	$keyValue.key:=$key
	$keyValue.value:=$value
	$keyValue.type:=$type
End use 