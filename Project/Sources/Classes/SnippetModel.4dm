Class constructor
	This:C1470.id:=Generate UUID:C1066
	This:C1470.friendlyName:=""
	This:C1470.SetName("Random Name "+String:C10(Milliseconds:C459))
	This:C1470.ClearPermittedWindowTypes()
	This:C1470.SetSnippet("default snippet")
	This:C1470.SetLocationToApply("cursor")
	
Function copy()->$duplicateSnippet : cs:C1710.SnippetModel
	$duplicateSnippet:=cs:C1710.SnippetModel.new()
	$duplicateSnippet.id:=Generate UUID:C1066
	$duplicateSnippet.SetName(This:C1470.GetName()+" Copy")
	$duplicateSnippet.SetLocationToApply(This:C1470.GetLocationToApply())
	$duplicateSnippet.SetSnippet(This:C1470.GetSnippet())
	$duplicateSnippet.limitToWindowTypes:=This:C1470.GetListOfPermittedWindowTypes()
	
Function _UpdateFriendlyName()
	This:C1470.friendlyName:=This:C1470.name+" ("+This:C1470.GetLocationToApply()+")"
	
Function GetId()->$id : Text
	$id:=This:C1470.id
	
Function SetName($name : Text)
	This:C1470.name:=$name
	This:C1470._UpdateFriendlyName()
	
Function GetName()->$name : Text
	$name:=This:C1470.name
	
Function SetSnippet($snippet : Text)
	This:C1470.snippet:=$snippet
	
Function GetSnippet()->$snippet : Text
	$snippet:=This:C1470.snippet
	
Function SetLocationToApply($location : Text)
	ASSERT:C1129(New collection:C1472("cursor"; "top"; "bottom").indexOf($location)>=0; "unsupported location")
	This:C1470.locationToInsert:=$location
	This:C1470._UpdateFriendlyName()
	
Function GetLocationToApply()->$location : Text
	$location:=This:C1470.locationToInsert
	
Function ClearPermittedWindowTypes()
	This:C1470.limitToWindowTypes:=New collection:C1472
	
Function GetListOfPermittedWindowTypes()->$supportedWindowtypes : Collection
	$supportedWindowtypes:=This:C1470.limitToWindowTypes.copy()
	
Function AddPermitedWindowType($type : Text)
	If (This:C1470.limitToWindowTypes.indexOf($type)<0)
		This:C1470.limitToWindowTypes.push($type)
	End if 
	
Function RemovePermitedWindowType($type : Text)
	var index : Integer
	$index:=This:C1470.limitToWindowTypes.indexOf($type)
	If ($index>=0)
		This:C1470.limitToWindowTypes:=This:C1470.limitToWindowTypes.remove($index; 1)
	End if 
	
Function IsWindowTypePermitted($type : Text)->$isSupported : Boolean
	$isSupported:=(This:C1470.limitToWindowTypes.indexOf($type)>=0)
	
	