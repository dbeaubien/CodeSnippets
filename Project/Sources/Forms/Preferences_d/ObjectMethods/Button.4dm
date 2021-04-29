var $keyValuePair : Object
$keyValuePair:=New object:C1471
$keyValuePair.key:="__NEW TAG__"
$keyValuePair.value:="__NEW VALUE__"
$keyValuePair.type:="static"

Form:C1466.keyValuePairs.push($keyValuePair)
Form:C1466.keyValuePairs:=Form:C1466.keyValuePairs.orderBy("key")  // force an update

//LISTBOX SELECT ROW(*; "tags_lb"; 0; lk remove from selection)
//LISTBOX SELECT ROW(*; "tags_lb"; Form.keyValuePairs.length; lk add to selection)