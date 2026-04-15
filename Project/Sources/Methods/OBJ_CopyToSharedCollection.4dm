//%attributes = {"invisible":true,"preemptive":"capable"}
// OBJ_CopyToSharedCollection (fromCollection, toSharedCollection)
//
#DECLARE($fromCollection : Collection; $toCollection : Collection)
// ----------------------------------------------------
// HISTORY
//   Published On: February 8, 2019 (https://kb.4d.com/assetid=78197)
// ----------------------------------------------------
ASSERT:C1129(Count parameters:C259=2)

var $counter : Integer
For ($counter; 0; $fromCollection.length-1)
	Case of 
		: (Value type:C1509($fromCollection[$counter])=Is object:K8:27)  //Element type is object, copy with OBJ_CopyObject 
			$toCollection[$counter]:=New shared object:C1526
			Use ($toCollection[$counter])
				OBJ_CopyToSharedObject($fromCollection[$counter]; $toCollection[$counter])
			End use 
			
		: (Value type:C1509($fromCollection[$counter])=Is collection:K8:32)  //Element type is collection, copy with OBJ_CopyCollection //Element type is collection, copy with OB_CopyCollection//Element type is collection, copy with OB_CopyCollection
			$toCollection[$counter]:=New shared collection:C1527
			Use ($toCollection[$counter])
				OBJ_CopyToSharedCollection($fromCollection[$counter]; $toCollection[$counter])
			End use 
			
		Else   // Other supported types can be copied directly.
			$toCollection[$counter]:=$fromCollection[$counter]
	End case 
End for 