// KeyValuePairs_GetFilePath () : filePath
//
var $0 : Text
var $file : Object

// ----------------------------------------------------
// HISTORY
//   Created by: Dani Beaubien (04/28/2021)
// ----------------------------------------------------
ASSERT(Count parameters=0)
$file:=Folder(fk user preferences folder).file("4D Snippets key-value pairs.json")
If (Not($file.exists))
	$file.setText("[]")
End if 

$0:=$file.platformPath
