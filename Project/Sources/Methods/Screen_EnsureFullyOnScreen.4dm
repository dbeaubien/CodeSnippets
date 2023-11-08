//%attributes = {}
// Screen_EnsureFullyOnScreen (placement)
//
// DESCRIPTION
//   Adjusts the center point so that the requested
//   width and height are fully on the screen.
//
#DECLARE($placement : Object)
// ----------------------------------------------------
ASSERT:C1129(Count parameters:C259=1)

var $center_on_screen : Integer
$center_on_screen:=Screen_WhichOneIsPointOn($placement)

// ensure we have the correct screens coordinates
var $left; $top; $right; $bottom : Integer
SCREEN COORDINATES:C438($left; $top; $right; $bottom\
; $center_on_screen; Screen work area:K27:10)

var $screen_half_width; $screen_half_height : Integer
$screen_half_width:=Int:C8($placement.requested_width/2)+5  // add 5 pixels of "space"
$screen_half_height:=Int:C8($placement.requested_height/2)+5  // add 5 pixels of "space"

// to far to the left to show full screen?
If ($left>($placement.horz_center-$screen_half_width))
	$placement.horz_center:=$left+$screen_half_width
End if 

// to far to the right to show full screen?
If ($right<($placement.horz_center+$screen_half_width))
	$placement.horz_center:=$right-$screen_half_width
End if 

// to far up to show full screen?
If ($top>($placement.vert_center-$screen_half_height))
	$placement.vert_center:=$top+$screen_half_height
End if 

// to far down to show full screen?
If ($bottom<($placement.vert_center+$screen_half_height))
	$placement.vert_center:=$bottom-$screen_half_height
End if 
