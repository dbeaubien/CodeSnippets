//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
// SOURCE: https://github.com/miyako/4d-utility-window-bounds

C_OBJECT:C1216($0)

$projectName:=Folder:C1567(fk database folder:K87:14; *).name
$folderName:=Folder:C1567(fk database folder:K87:14).name  //Bounds

$prefFolder:=Folder:C1567(fk user preferences folder:K87:10).folder($projectName).folder($folderName)
$prefFolder.create()

$0:=$prefFolder