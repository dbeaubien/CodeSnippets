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
	
	C_LONGINT:C283($left; $top; $right; $bottom)
	
	$appVersion:=Application version:C493
	If (Not:C34(is_preemtive))
		//%T-
		$screen:=Menu bar screen:C441
		If ($appVersion>="1820")
			Formula from string:C1601(Command name:C538(438)+"($1->;$2->;$3->;$4->;$5;$6)").call(Null:C1517; ->$left; ->$top; ->$right; ->$bottom; $screen; 1)  //Screen work area
		Else 
			SCREEN COORDINATES:C438($left; $top; $right; $bottom; $screen)
		End if 
		//%T+
	End if 
	
	If ($formFile.exists)
		$json:=$formFile.getText("utf-8"; Document with CR:K24:21)
		$formRect:=JSON Parse:C1218($json; Is object:K8:27)
		//for backward compatibility with old code
		If ($formRect.left=Null:C1517)
			$formRect.left:=$formRect.x
		End if 
		If ($formRect.top=Null:C1517)
			$formRect.top:=$formRect.y
		End if 
		If ($formRect.screen=Null:C1517)
			$formRect.screen:=1
		End if 
	Else 
		
		If (Not:C34(is_preemtive))
			C_LONGINT:C283($width; $height)
			//%T-
			If ($tableName="{projectForm}")
				FORM GET PROPERTIES:C674($formName; $width; $height)
			Else 
				$tableNumber:=ds:C1482[$tableName].getInfo().tableNumber
				C_POINTER:C301($table)
				$table:=Table:C252($tableNumber)
				FORM GET PROPERTIES:C674($table->; $formName; $width; $height)
			End if 
			//%T+
			$formRect:=New object:C1471("x"; 0; "y"; 0; "width"; $width; "height"; $height; "screen"; $screen; "left"; 0; "top"; 0)
		End if 
		
	End if 
	
	If ($formRect#Null:C1517)
		
		C_LONGINT:C283($x; $y; $s)
		
		If (Not:C34(is_preemtive))
			//%T-
			$s:=Menu bar screen:C441
			SCREEN COORDINATES:C438($sleft; $stop; $sright; $sbottom; $s)
			$x:=$formRect.left*($sright-$sleft)
			$y:=$formRect.top*($sbottom-$stop)
			If ($s#$formRect.screen)
				SCREEN COORDINATES:C438($sleft; $stop; $sright; $sbottom; $formRect.screen)
				If ($formRect.x>=$sleft) & ($formRect.x<=$sright) & ($formRect.y>=$stop) & ($formRect.y<=$sbottom)
					$x:=$formRect.x
					$y:=$formRect.y
				End if 
			End if 
			//%T+
		End if 
		
		$formRect.x:=$x
		$formRect.y:=$y
		
		$0:=$formRect
		
	End if 
	
End if 