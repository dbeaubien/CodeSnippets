//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
// SOURCE: https://github.com/miyako/4d-utility-window-bounds

#DECLARE()->$prefFolder : 4D:C1709.Folder

$prefFolder:=Folder:C1567(fk user preferences folder:K87:10)\
.folder(Folder:C1567(fk database folder:K87:14; *).name)\
.folder(Folder:C1567(fk database folder:K87:14).name)

$prefFolder.create()