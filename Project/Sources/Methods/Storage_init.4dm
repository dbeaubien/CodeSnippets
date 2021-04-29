//%attributes = {"invisible":true,"preemptive":"capable"}
// Storage_init ()
//
// ----------------------------------------------------
// HISTORY
//   Created by: Dani Beaubien (04/19/2021)
// ----------------------------------------------------
ASSERT:C1129(Count parameters:C259=0)

If (Storage:C1525.keyValuePairs=Null:C1517)
	Use (Storage:C1525)
		Storage:C1525.keyValuePairs:=New shared collection:C1527
	End use 
End if 
