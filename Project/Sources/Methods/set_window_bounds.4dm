//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
// SOURCE: https://github.com/miyako/4d-utility-window-bounds

#DECLARE($formIdentifier : Text)

$info:=split_form_identifier($formIdentifier)

If ($info#Null:C1517)
	
	var $tableName; $formName : Text
	$tableName:=$info.table
	$formName:=$info.form
	
	$formFile:=get_window_bounds_file($tableName; $formName)
	
	var $formRect : Object
	
	If (Not:C34(is_preemtive))
		//%T-
		$window:=Current form window:C827
		//%T+
		If ($window#0)
			
			var $left; $top : Real
			var $x; $y; $right; $bottom; $screen; $s : Integer
			//%T-
			GET WINDOW RECT:C443($x; $y; $right; $bottom; $window)
			
			var $sleft; $stop; $sright; $sbottom : Integer
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