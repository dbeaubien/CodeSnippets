//%attributes = {"invisible":true,"preemptive":"capable"}
// KeyValuePairs_GetFilePath () : filePath
//
var $0; $filePath : Text
// ----------------------------------------------------
// HISTORY
//   Created by: Dani Beaubien (04/28/2021)
// ----------------------------------------------------
ASSERT:C1129(Count parameters:C259=0)
$filePath:=""

$filePath:=System folder:C487(User preferences_user:K41:4)
$filePath:=$filePath+"4D Snippets key-value pairs.json"

$0:=$filePath