// This is a container for all the custom processing code.

Class constructor($hostPreprocessMethod : Text)
	This:C1470.hostPreprocessMethod:=""
	If (Count parameters:C259=1)
		This:C1470.hostPreprocessMethod:=$hostPreprocessMethod
	End if 
	
	
	
Function PreProcessSnippet($inSnippet : Text; $windowTitle : Text)->$outSnippet : Text
	ASSERT:C1129(Count parameters:C259=2)
	var $listOfTagsInSnippet : Collection
	$listOfTagsInSnippet:=This:C1470._GetTags($inSnippet)
	$outSnippet:=$inSnippet
	
	var $tag; $replacementText : Text
	For each ($tag; $listOfTagsInSnippet)
		$replacementText:=Snippet__GetKeyValue($tag)
		Case of 
			: ($replacementText#"")  // user supplied tag
				
			: ($tag="time")
				$replacementText:=String:C10(Current time:C178; HH MM AM PM:K7:5)
				
			: ($tag="timestamp")
				$replacementText:=String:C10(Current date:C33; Internal date short:K1:7)
				$replacementText:=$replacementText+" "+String:C10(Current time:C178; HH MM AM PM:K7:5)
				
			: ($tag="methodName")
				var $pos : Integer
				$pos:=Position:C15(":"; $windowTitle)
				If ($pos>0)
					$replacementText:=Substring:C12($windowTitle; $pos+2)
				Else 
					$replacementText:=$windowTitle
				End if 
				
			: ($tag="date")
				$replacementText:=String:C10(Current date:C33; Internal date short:K1:7)
				
			: ($tag="date:@")
				
			Else 
				$tag:=""  //do nothing
		End case 
		
		If ($tag#"")
			$tag:="{{"+$tag+"}}"  // restore it back to the full tag
			$outSnippet:=Replace string:C233($outSnippet; $tag; $replacementText)
		End if 
	End for each 
	
	
	
Function _GetTags($inSnippet : Text)->$listOfTagsInSnippet : Collection
	var $openTagPos; $closeTagPos; $currentPos : Integer
	$listOfTagsInSnippet:=New collection:C1472
	
	Repeat 
		$openTagPos:=Position:C15("{{"; $inSnippet; $currentPos)
		If ($openTagPos>0)
			$closeTagPos:=Position:C15("}}"; $inSnippet; $openTagPos)
			If ($closeTagPos>0)
				$openTagPos:=$openTagPos+2  // skip over the "{{"
				$listOfTagsInSnippet.push(Substring:C12($inSnippet; $openTagPos; ($closeTagPos-$openTagPos)))
			Else 
				$openTagPos:=0  // bail, no closing tag so we are done
			End if 
		End if 
		$currentPos:=$closeTagPos
	Until ($openTagPos=0)
	
	$listOfTagsInSnippet:=$listOfTagsInSnippet.distinct(ck diacritical:K85:3)