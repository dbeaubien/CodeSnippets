//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}

// SOURCE: https://github.com/miyako/4d-utility-window-bounds

C_TEXT:C284($1)
C_OBJECT:C1216($0; $EXPORT)

$name:=Current method name:C684

If (Storage:C1525[$name]=Null:C1517)
	Use (Storage:C1525)
		$EXPORT:=New shared object:C1526
		Storage:C1525[$name]:=$EXPORT
	End use 
Else 
	$EXPORT:=Storage:C1525[$name]
End if 

If ($EXPORT[$name]=Null:C1517)
	
	Use ($EXPORT)
		
		$EXPORT.set:=Formula:C1597(set_window_bounds)
		$EXPORT.get:=Formula:C1597(get_window_bounds)
		
		$EXPORT[$name]:=Formula:C1597(This:C1470)
		
	End use 
	
End if 

$0:=$EXPORT