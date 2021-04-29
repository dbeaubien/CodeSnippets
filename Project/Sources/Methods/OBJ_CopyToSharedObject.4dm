//%attributes = {"invisible":true,"preemptive":"capable"}
// OBJ_CopyToSharedObject (fromObject, toSharedObject)
// OBJ_CopyToSharedObject (object, object)
//
// DESCRIPTION
//   $1: Object to copy from
//   $2: Shared Object to copy to
//
C_OBJECT:C1216($1; $2)
// ----------------------------------------------------
// HISTORY
//   Published On: February 8, 2019 (https://kb.4d.com/assetid=78197)
// ----------------------------------------------------

If (Asserted:C1132(Count parameters:C259=2))
	ARRAY TEXT:C222($arrNames; 0)
	OB GET PROPERTY NAMES:C1232($1; $arrNames; $arrTypes)
	
	C_LONGINT:C283($counter)
	For ($counter; 1; Size of array:C274($arrNames))
		Case of 
			: ($arrTypes{$counter}=Is object:K8:27)  //Attribute type is object, copy with OB_CopyObject again
				$2[$arrNames{$counter}]:=New shared object:C1526
				Use ($2[$arrNames{$counter}])
					OBJ_CopyToSharedObject($1[$arrNames{$counter}]; $2[$arrNames{$counter}])
				End use 
				
			: ($arrTypes{$counter}=Is collection:K8:32)  //Attribute type is collection, copy with OB_CopyCollection
				$2[$arrNames{$counter}]:=New shared collection:C1527
				Use ($2[$arrNames{$counter}])
					OBJ_CopyToSharedCollection($1[$arrNames{$counter}]; $2[$arrNames{$counter}])
				End use 
				
			Else   // The rest supported types can be copied directly.
				$2[$arrNames{$counter}]:=$1[$arrNames{$counter}]
		End case 
	End for 
End if 