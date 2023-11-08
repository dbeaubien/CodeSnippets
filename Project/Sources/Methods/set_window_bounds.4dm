//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
// SOURCE: https://github.com/miyako/4d-utility-window-bounds

C_TEXT:C284($1; $formIdentifier)

$formIdentifier:=$1

$info:=split_form_identifier($formIdentifier)

If ($info#Null:C1517)
	
	C_TEXT:C284($tableName; $formName)
	$tableName:=$info.table
	$formName:=$info.form
	
	$formFile:=get_window_bounds_file($tableName; $formName)
	
	C_OBJECT:C1216($formRect)
	
	If (Not:C34(is_preemtive))
		//%T-
		$window:=Current form window:C827
		//%T+
		If ($window#0)
			
			C_REAL:C285($left; $top)
			C_LONGINT:C283($x; $y; $right; $bottom; $screen; $s)
			//%T-
			GET WINDOW RECT:C443($x; $y; $right; $bottom; $window)
			C_LONGINT:C283($sleft; $stop; $sright; $sbottom)
			$screen:=Menu bar screen:C441
			SCREEN COORDINATES:C438($sleft; $stop; $sright; $sbottom; $screen)
			$left:=($x-$sleft)/($sright-$sleft)
			$top:=($y-$stop)/($sbottom-$stop)
			For ($s; 1; Count screens:C437)
				SCREEN COORDINATES:C438($sleft; $stop; $sright; $sbottom; $s)
				If ($x>=$sleft) & ($x<=$sright) & ($y>=$stop) & ($y<=$sbottom)
					$screen:=$s
					$left:=($x-$sleft)/($sright-$sleft)
					$top:=($y-$stop)/($sbottom-$stop)
				End if 
			End for 
			//%T+
			$formRect:=New object:C1471("x"; $x; "y"; $y; "width"; $right-$x; "height"; $bottom-$y; "screen"; $screen; "left"; $left; "top"; $top)
			$json:=JSON Stringify:C1217($formRect; *)
			$formFile.setText($json; "utf-8"; Document with CR:K24:21)
			
		End if 
		
	End if 
	
End if 