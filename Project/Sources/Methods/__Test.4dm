//%attributes = {}

var $controller : cs:C1710.SnippetController
$controller:=cs:C1710.SnippetController.new()

var $snippet : cs:C1710.SnippetModel
$snippet:=cs:C1710.SnippetModel.new()
$snippet.SetName("Test#3")
$snippet.SetSnippet("<timestamp> test")
$snippet.AddPermitedWindowType("Method")
$snippet.SetLocationToApply("Top")
$controller.AddSnippetToList($snippet)

$snippet:=cs:C1710.SnippetModel.new()
$snippet.SetName("Test#2")
$snippet.SetSnippet("Another Test")
$snippet.AddPermitedWindowType("Method")
$snippet.SetLocationToApply("Bottom")
$controller.AddSnippetToList($snippet)

$snippet:=cs:C1710.SnippetModel.new()
$snippet.SetName("Test#1")
$snippet.SetSnippet("Yet Another Test")
$snippet.AddPermitedWindowType("Class")
$snippet.SetLocationToApply("Bottom")
$controller.AddSnippetToList($snippet)

$snippet:=cs:C1710.SnippetModel.new()
$snippet.SetName("Test#4")
$snippet.SetSnippet("Yet Another Test")
$snippet.AddPermitedWindowType("Class")
$snippet.AddPermitedWindowType("Method")
$snippet.AddPermitedWindowType("Object Method")
$snippet.AddPermitedWindowType("Form Method")
$snippet.AddPermitedWindowType("Trigger")
$snippet.AddPermitedWindowType("Database Method")
$snippet.SetLocationToApply("Cursor")
$controller.AddSnippetToList($snippet)

var $list : Collection
$list:=$controller.GetSnippetListByType("@")
$list:=$controller.GetSnippetListByType("Class")
$list:=$controller.GetSnippetListByType("Method")

BEEP:C151
ABORT:C156
SET DATABASE LOCALIZATION:C1104("FR")
SET DATABASE LOCALIZATION:C1104("EN")

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