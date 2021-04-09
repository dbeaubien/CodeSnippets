Class constructor
	This:C1470.version:=1  // used for checking against the version in files on disk
	This:C1470.snippetList:=New collection:C1472
	
	
Function AddSnippetToList($snippet : cs:C1710.SnippetModel)
	This:C1470.snippetList:=This:C1470.snippetList.push($snippet).orderBy("name")
	
	
Function RemoveSnippetFromListById($id : Text)
	var $snippet : cs:C1710.SnippetModel
	var $index : Integer
	For each ($snippet; This:C1470.snippetList)
		If ($id=$snippet.GetId())
			$index:=This:C1470.snippetList.indexOf($snippet)
			This:C1470.snippetList.remove($index; 1)
		End if 
	End for each 
	
	
Function GetSnippetListByType($type : Text)->$snippetFilteredList : Collection
	var $snippet : cs:C1710.SnippetModel
	$snippetFilteredList:=New collection:C1472
	For each ($snippet; This:C1470.snippetList)
		If ($snippet.IsWindowTypePermitted($type))
			$snippetFilteredList.push($snippet)
		End if 
	End for each 
	
	
Function ApplySnippetToDevWindow($snippet : cs:C1710.SnippetModel)
	var $currentPasteboard : Text
	var $winRef; $processNumber : Integer
	var $l; $t; $r; $b : Integer
	
	$winRef:=Frontmost window:C447
	$processNumber:=Window process:C446($winRef)
	If ($processNumber>0)
		var $snippetText : Text
		var $preprocessor : cs:C1710.SnippetPreProcessor
		$snippetText:=$snippet.GetSnippet()
		$preprocessor:=cs:C1710.SnippetPreProcessor.new()
		$snippetText:=$preprocessor.PreProcessSnippet($snippetText; Get window title:C450($winRef))
		
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
		
		SET TEXT TO PASTEBOARD:C523($snippetText)
		POST KEY:C465(Character code:C91("v"); Command key mask:K16:1; $processNumber)
		DELAY PROCESS:C323(Current process:C322; 5)
		
		SET TEXT TO PASTEBOARD:C523($currentPasteboard)
	End if 
	
	
Function _GetFilePath()->$filePath : Text
	$filePath:=System folder:C487(User preferences_user:K41:4)
	$filePath:=$filePath+"4D Snippets.json"
	
	
Function SaveToDisk
	var $filePath : Text
	var $snippet : cs:C1710.SnippetModel
	var $snippetCollection : Collection
	
	$filePath:=This:C1470._GetFilePath()
	If (Test path name:C476($filePath)=Is a document:K24:1)
		$fileRef:=Open document:C264($filePath)
	Else 
		$fileRef:=Create document:C266($filePath)
	End if 
	If (OK=1)
		$snippetCollection:=New collection:C1472
		For each ($snippet; This:C1470.snippetList)
			$snippetCollection.push($snippet.ToString())
		End for each 
		SEND PACKET:C103($fileRef; JSON Stringify:C1217($snippetCollection; *))
		CLOSE DOCUMENT:C267($fileRef)
	End if 
	
	
Function LoadFromDisk
	var $filePath : Text
	$filePath:=This:C1470._GetFilePath()
	If (Test path name:C476($filePath)#Is a document:K24:1)
		$filePath:=Get 4D folder:C485(Current resources folder:K5:16)
		$filePath:=$filePath+"4D Snippets Default.json"
	End if 
	
	var $snippet : cs:C1710.SnippetModel
	var $snippetAsText : Text
	var $snippetCollection : Collection
	
	$snippetAsText:=Document to text:C1236($filePath)
	$snippetCollection:=JSON Parse:C1218($snippetAsText)
	For each ($snippetAsText; $snippetCollection)
		$snippet:=cs:C1710.SnippetModel.new()
		$snippet.FromString($snippetAsText)
		This:C1470.AddSnippetToList($snippet)
	End for each 
	