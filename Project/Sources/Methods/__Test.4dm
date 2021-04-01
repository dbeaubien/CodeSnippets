//%attributes = {}

ARRAY LONGINT:C221($windowRefsArr; 0)
WINDOW LIST:C442($windowRefsArr)

C_TEXT:C284($titles)
C_OBJECT:C1216($processInfo)
C_COLLECTION:C1488($processActivityList)
C_LONGINT:C283($i; $winRef; $processNumber)
$titles:=""


$winRef:=Frontmost window:C447
$processNumber:=Window process:C446($winRef)
$processActivityList:=Get process activity:C1495.processes
$processActivityList:=$processActivityList.query("number=:1"; $processNumber)
If ($processActivityList.length>0)
	$processInfo:=$processActivityList[0]
End if 
$titles:=$titles+"FRONT winRef "+String:C10($winRef)
$titles:=$titles+" p"+String:C10($processNumber)+" ("+$processInfo.name+")"
$titles:=$titles+": "
$titles:=$titles+Get window title:C450($winRef)
$titles:=$titles+"\r"


// List of windows in their order of depth, frontmost to backmost
For ($i; 1; Size of array:C274($windowRefsArr))
	$winRef:=$windowRefsArr{$i}
	$processNumber:=Window process:C446($winRef)
	
	$processActivityList:=Get process activity:C1495.processes
	$processActivityList:=$processActivityList.query("number=:1"; $processNumber)
	If ($processActivityList.length>0)
		$processInfo:=$processActivityList[0]
	End if 
	
	$titles:=$titles+"winRef "+String:C10($winRef)
	$titles:=$titles+" p"+String:C10($processNumber)+" ("+$processInfo.name+")"
	$titles:=$titles+": "
	$titles:=$titles+Get window title:C450($winRef)
	$titles:=$titles+"\r"
End for 
//PROCESS PROPERTIES
//Design process

ALERT:C41($titles)