Class constructor
	This:C1470.version:=1  // used for checking against the version in files on disk
	This:C1470.snippetList:=New collection:C1472
	
	
Function AddSnippetToList($snippet : cs:C1710.Snippet)
	This:C1470.snippetList:=This:C1470.snippetList.push($snippet).orderBy("name")
	
	
Function RemoveSnippetFromListById($id : Text)
	var $snippet : cs:C1710.Snippet
	var $index : Integer
	For each ($snippet; This:C1470.snippetList)
		If ($id=$snippet.GetId())
			$index:=This:C1470.snippetList.indexOf($snippet)
			This:C1470.snippetList.remove($index; 1)
		End if 
	End for each 
	
	
Function GetSnippetListByType($type : Text)->$snippetFilteredList : Collection
	var $snippet : cs:C1710.Snippet
	$snippetFilteredList:=New collection:C1472
	For each ($snippet; This:C1470.snippetList)
		If ($snippet.IsWindowTypePermitted($type))
			$snippetFilteredList.push($snippet)
		End if 
	End for each 
	
	
Function ApplySnippetToDevWindow($snippet : cs:C1710.Snippet)
	var $currentPasteboard : Text
	var $winRef; $processNumber : Integer
	var $l; $t; $r; $b : Integer
	
	$winRef:=Frontmost window:C447
	$processNumber:=Window process:C446($winRef)
	If ($processNumber>0)
		$currentPasteboard:=Get text from pasteboard:C524
		GET WINDOW RECT:C443($l; $t; $r; $b; $winRef)
		SET WINDOW RECT:C444($l; $t; $r; $b; $winRef)
		
		If ($snippet.GetLocationToApply()#"Cursor")
			POST KEY:C465(Character code:C91("a"); Command key mask:K16:1; $processNumber)
			DELAY PROCESS:C323(Current process:C322; 5)
			
			If ($snippet.GetLocationToApply()="Top")
				POST KEY:C465(Up arrow key:K12:18; 0; $processNumber)
			End if 
			If ($snippet.GetLocationToApply()="Bottom")
				POST KEY:C465(Down arrow key:K12:19; 0; $processNumber)
			End if 
			DELAY PROCESS:C323(Current process:C322; 5)
		End if 
		
		SET TEXT TO PASTEBOARD:C523($snippet.GetSnippet())
		POST KEY:C465(Character code:C91("v"); Command key mask:K16:1; $processNumber)
		DELAY PROCESS:C323(Current process:C322; 5)
		
		SET TEXT TO PASTEBOARD:C523($currentPasteboard)
	End if 
	
	
Function LoadFromDisk($filePath : Text)
	var $snippet : cs:C1710.SnippetModel
	$snippet:=cs:C1710.SnippetModel.new()
	$snippet.SetName("Test#3")
	$snippet.SetSnippet("<timestamp> test")
	$snippet.AddPermitedWindowType("Method")
	$snippet.AddPermitedWindowType("Form Method")
	$snippet.SetLocationToApply("top")
	This:C1470.AddSnippetToList($snippet)
	
	$snippet:=cs:C1710.SnippetModel.new()
	$snippet.SetName("Test#2")
	$snippet.SetSnippet("Another Test")
	$snippet.AddPermitedWindowType("Method")
	$snippet.SetLocationToApply("Bottom")
	This:C1470.AddSnippetToList($snippet)
	
	$snippet:=cs:C1710.SnippetModel.new()
	$snippet.SetName("Test#1")
	$snippet.SetSnippet("Yet Another Test")
	$snippet.AddPermitedWindowType("Class")
	$snippet.SetLocationToApply("Bottom")
	This:C1470.AddSnippetToList($snippet)
	
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
	This:C1470.AddSnippetToList($snippet)
	