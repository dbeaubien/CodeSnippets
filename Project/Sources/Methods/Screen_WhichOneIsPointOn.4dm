//%attributes = {}
// Screen_WhichOneIsPointOn (placement) : center_on_screen
//
// DESCRIPTION
//   Returns the screen number that the center point is on.
//
#DECLARE($placement : Object)->$center_on_screen : Integer
// ----------------------------------------------------
ASSERT:C1129(Count parameters:C259=1)
$center_on_screen:=1  // default to 1

var $i; $left; $top; $right; $bottom : Integer
For ($i; 2; Count screens:C437)
	SCREEN COORDINATES:C438($left; $top; $right; $bottom\
		; $i; Screen work area:K27:10)
	
	Case of 
		: ($placement.horz_center>$right)
		: ($placement.horz_center<$left)
		: ($placement.vert_center<$top)
		: ($placement.vert_center>$bottom)
		Else 
			$center_on_screen:=$i
			$i:=MAXINT:K35:1  // break the loop
	End case 
End for 
