//%attributes = {"invisible":true,"preemptive":"capable"}
// OBJ_CopyToSharedObject (fromObject, toSharedObject)
//
#DECLARE($fromObject : Object; $toObject : Object)
// ----------------------------------------------------
// HISTORY
//   Published On: February 8, 2019 (https://kb.4d.com/assetid=78197)
// ----------------------------------------------------

If (Asserted:C1132(Count parameters:C259=2))
	ARRAY TEXT:C222($arrNames; 0)
	OB GET PROPERTY NAMES:C1232($fromObject; $arrNames; $arrTypes)
	
	var $counter : Integer
	For ($counter; 1; Size of array:C274($arrNames))
		Case of 
			: ($arrTypes{$counter}=Is object:K8:27)  //Attribute type is object, copy with OB_CopyObject again
				$toObject[$arrNames{$counter}]:=New shared object:C1526
				Use ($toObject[$arrNames{$counter}])
					OBJ_CopyToSharedObject($fromObject[$arrNames{$counter}]; $toObject[$arrNames{$counter}])
				End use 
				
			: ($arrTypes{$counter}=Is collection:K8:32)  //Attribute type is collection, copy with OB_CopyCollection
				$toObject[$arrNames{$counter}]:=New shared collection:C1527
				Use ($toObject[$arrNames{$counter}])
					OBJ_CopyToSharedCollection($fromObject[$arrNames{$counter}]; $toObject[$arrNames{$counter}])
				End use 
				
			Else   // The rest supported types can be copied directly.
				$toObject[$arrNames{$counter}]:=$fromObject[$arrNames{$counter}]
		End case 
	End for 
End if 