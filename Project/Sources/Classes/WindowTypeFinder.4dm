Class constructor
	This:C1470.windowPrefixList:=This:C1470._GetList()
	
	
Function GetTypeForWindow($winRef : Integer)->$windowType : Text
	var $devWindowType : Object
	var $windowTitle : Text
	
	$windowType:="not supported"
	$windowTitle:=Get window title:C450($winRef)
	For each ($devWindowType; This:C1470.windowPrefixList)
		If ($windowTitle=($devWindowType.windowTitlePrefix+"@"))
			$windowType:=$devWindowType.type
		End if 
	End for each 
	
	
Function GetSupportedTypes()->$windowTypeList : Collection
	$windowTypeList:=$windowPrefixList.distinct("type").orderBy(ck ascending:K85:9)
	
	
Function _GetList()->$windowPrefixList : Collection
	$windowPrefixList:=New collection:C1472
	var $devWindowType : Object
	
	If (True:C214)  // Method windows
		$devWindowType:=New object:C1471
		$devWindowType.type:="Method"
		$devWindowType.windowTitlePrefix:="Method: "
		$windowPrefixList.push($devWindowType)
		
		$devWindowType:=New object:C1471
		$devWindowType.type:="Method"
		$devWindowType.windowTitlePrefix:="Methode: "
		$windowPrefixList.push($devWindowType)
	End if 
	
	If (True:C214)  // Object Method windows
		$devWindowType:=New object:C1471
		$devWindowType.type:="Object Method"
		$devWindowType.windowTitlePrefix:="Object Method: "
		$windowPrefixList.push($devWindowType)
		
		$devWindowType:=New object:C1471
		$devWindowType.type:="Object Method"
		$devWindowType.windowTitlePrefix:="Méthode objet: "
		$windowPrefixList.push($devWindowType)
	End if 
	
	If (True:C214)  // Form Method windows
		$devWindowType:=New object:C1471
		$devWindowType.type:="Form Method"
		$devWindowType.windowTitlePrefix:="Form Method: "
		$windowPrefixList.push($devWindowType)
		
		$devWindowType:=New object:C1471
		$devWindowType.type:="Form Method"
		$devWindowType.windowTitlePrefix:="Méthode formulaire: "
		$windowPrefixList.push($devWindowType)
	End if 
	
	If (True:C214)  // Trigger windows
		$devWindowType:=New object:C1471
		$devWindowType.type:="Trigger"
		$devWindowType.windowTitlePrefix:="Trigger: "
		$windowPrefixList.push($devWindowType)
	End if 
	
	If (True:C214)  // Class windows
		$devWindowType:=New object:C1471
		$devWindowType.type:="Class"
		$devWindowType.windowTitlePrefix:="Class: "
		$windowPrefixList.push($devWindowType)
	End if 
	
	If (True:C214)  // Database Method windows
		$devWindowType:=New object:C1471
		$devWindowType.type:="Database Method"
		$devWindowType.windowTitlePrefix:="On "
		$windowPrefixList.push($devWindowType)
		
		$devWindowType:=New object:C1471
		$devWindowType.type:="Database Method"
		$devWindowType.windowTitlePrefix:="Sur "
		$windowPrefixList.push($devWindowType)
	End if 
	
	