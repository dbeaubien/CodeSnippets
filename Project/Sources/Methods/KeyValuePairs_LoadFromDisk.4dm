//%attributes = {"invisible":true,"preemptive":"capable"}
// KeyValuePairs_SaveToDisk ()
//
// DESCRIPTION
//   Loads the static key/value pairs to disk while
//   retaining any code key/value pairs.
//
// ----------------------------------------------------
// HISTORY
//   Created by: Dani Beaubien (04/28/2021)
// ----------------------------------------------------
ASSERT:C1129(Count parameters:C259=0)

Storage_init

var $keyValuePairsToRetain : Collection
$keyValuePairsToRetain:=Storage:C1525.keyValuePairs.query("type=:1"; "code")

var $json : Text
$json:=Document to text:C1236(KeyValuePairs_GetFilePath)

var $keyValuePairsFromDisk : Collection
$keyValuePairsFromDisk:=JSON Parse:C1218($json)

var $keyValuePair : Object
Use (Storage:C1525)
	Storage:C1525.keyValuePairs:=New shared collection:C1527
End use 

Use (Storage:C1525.keyValuePairs)
	OBJ_CopyToSharedCollection($keyValuePairsFromDisk; Storage:C1525.keyValuePairs)
	
	For each ($keyValuePair; $keyValuePairsToRetain)
		Storage:C1525.keyValuePairs.push(\
			New shared object:C1526(\
			"key"; $keyValuePair.key; \
			"value"; $keyValuePair.value; \
			"type"; $keyValuePair.type\
			))
	End for each 
End use 
