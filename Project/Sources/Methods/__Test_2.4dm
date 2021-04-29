//%attributes = {}

Snippet_SetKeyValue("me"; "Dani Beaubien")
Snippet_SetKeyValue("task"; "9630")

var $inSnippet; $outSnippet : Text

// {{methodName}}
// {{timestamp}}
// {{date}} // uses "Internal date short"
// {{time}} / uses "HH MM AM PM"

$inSnippet:="{{timestamp}}: {{methodName}} This is a {{date}} test of {{time}} and {{me}}."

var $preprocessor : cs:C1710.SnippetPreProcessor
$preprocessor:=cs:C1710.SnippetPreProcessor.new()

$outSnippet:=$preprocessor.PreProcessSnippet($inSnippet; "Method: __Test2")


KeyValuePairs_LoadFromDisk
KeyValuePairs_SaveToDisk

BEEP:C151
ABORT:C156

SHOW ON DISK:C922(System folder:C487(User preferences_user:K41:4)+"4D Snippets.json"; *)
BEEP:C151
ABORT:C156

SET DATABASE LOCALIZATION:C1104("FR")
SET DATABASE LOCALIZATION:C1104("EN")