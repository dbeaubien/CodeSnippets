//%attributes = {"invisible":true,"preemptive":"capable"}
// KeyValuePairs_SaveToDisk ()
//
// DESCRIPTION
//   Saves the static key/value pairs to disk.
//
// ----------------------------------------------------
// HISTORY
//   Created by: Dani Beaubien (04/28/2021)
// ----------------------------------------------------
ASSERT:C1129(Count parameters:C259=0)

var $keyValuePairsToSave : Collection
$keyValuePairsToSave:=Storage:C1525.keyValuePairs.query("type=:1"; "static")

var $json : Text
$json:=JSON Stringify:C1217($keyValuePairsToSave; *)

TEXT TO DOCUMENT:C1237(KeyValuePairs_GetFilePath; $json; "utf-8")