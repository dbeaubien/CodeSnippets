//%attributes = {}
var $Bounds : Object
$Bounds:=Bounds
$frames:=$Bounds.get("SnippetSelector_d")

/*

frames (object)

.x:       x pos adjusted for the current menu bar screen (in case the screen width has shrinked)
.y:       y pos adjusted for the current menu bar screen (in case the screen height has shrinked)
.left:    x pos on the screen when the window was closed (ratio to screen width)
.top:     y pos on the screen when the window was closed (ratio to screen height)
.width:   form width when the window was closed
.height:  form height when the window was closed
.screen:  screen where the window was closed

*/

If ($frames.x=0) & ($frames.y=0)
	$window:=Open form window:C675("SnippetSelector_d"; Plain form window:K39:10)
Else 
	$window:=Open form window:C675("SnippetSelector_d"; Plain form window:K39:10; $frames.x; $frames.y)
End if 

DIALOG:C40("SnippetSelector_d")

CLOSE WINDOW:C154($window)