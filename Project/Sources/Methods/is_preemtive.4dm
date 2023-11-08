//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
// SOURCE: https://github.com/miyako/4d-utility-window-bounds

C_BOOLEAN:C305($0)

C_LONGINT:C283($state; $mode)
C_REAL:C285($time)

PROCESS PROPERTIES:C336(Current process:C322; $name; $state; $time; $mode)

$0:=$mode ?? 1
