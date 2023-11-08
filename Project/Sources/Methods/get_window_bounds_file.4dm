//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
// SOURCE: https://github.com/miyako/4d-utility-window-bounds

C_TEXT:C284($1; $tableName; $2; $formName)
C_OBJECT:C1216($0)

$tableName:=$1
$formName:=$2

$prefFolder:=get_window_bounds_folder

$0:=$prefFolder.folder($tableName).file($formName+".json")