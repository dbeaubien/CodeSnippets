//%attributes = {"invisible":true,"preemptive":"capable"}
// KeyValuePairs_GetFilePath () : filePath
//
var $0 : Text
// ----------------------------------------------------
// HISTORY
//   Created by: Dani Beaubien (04/28/2021)
// ----------------------------------------------------
ASSERT:C1129(Count parameters:C259=0)

var $file : Object
$file:=Folder:C1567(fk user preferences folder:K87:10).file("4D Snippets key-value pairs.json")
If (Not:C34($file.exists))
	$file.setText("[]")
End if 

$0:=$file.platformPath
