//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
// SOURCE: https://github.com/miyako/4d-utility-window-bounds

#DECLARE($tableName : Text; $formName : Text) : Object
var $prefFolder : 4D:C1709.Folder
$prefFolder:=get_window_bounds_folder

return $prefFolder.folder($tableName).file($formName+".json")