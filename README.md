# CodeSnippets
A tool to allow 4D developers to easily store and re-use their favorite 4D code snippets. The component was developed in project mode with classes using 4D v18 R5.

## Overview
This component allows you to quickly define and use code snippets by a simple double-click of your mouse.

The snippet window filters the defined snippets so that only the appropriate ones are avaiable based on the current method window. The following shows some examples of what the Snippet window is showing based on the frontmost window:

<img src="https://github.com/4D-Open-Source/CodeSnippets/blob/main/README_Images/Snippet_for_database_method.png" width="25%" height="25%"> <img src="https://github.com/4D-Open-Source/CodeSnippets/blob/main/README_Images/Snippet_for_form_method.png" width="25%" height="25%"> <img src="https://github.com/4D-Open-Source/CodeSnippets/blob/main/README_Images/Snippet_for_method.png" width="25%" height="25%">

The snippet window will show the window title in bold above the snippets for your convenience. Double clicking a snippet will insert the snippet contents based on how it was defined.


## Setting up
Add the following code to your startup code to initalized and have the Snippet selector floating window opened and ready for you to use when you go into the design environment:
```
If (Not(Is compiled mode))
	Snippet_ShowSelectorWindow
End if 
```

## Snippet Editor
This snippet editor is accessable by right clicking the list of snippets. The editor lets you define:
- a name for the snippet
- the location of where the snippet will be inserted (top of the method, bottom of the method, or at the current cursor position)
- one or more method types that it applies to
- the actual snippet text to insert

<img src="https://github.com/4D-Open-Source/CodeSnippets/blob/main/README_Images/Snippet_editor.png" width="50%" height="50%">

All the defined snippets will be stored on disk in the ``System folder(User preferences_user)`` folder. On the first launch, default ones will be loaded from the component's resource folder.

## Tag Replacement
It is possible to embed special tags into the snippet text that is then replaced when the snippet is used.

By clicking on the "pref" button on the snippet window, you will be shown all the tags that you have defined directly in this dialog or using the ``Snippet_SetKeyValue`` method to define a dynamic tag

For example, the following code will define a tag named "{{appName}}" that when placed inside a snippet will be replaced with "myFavorite App" when used.
````
Snippet_SetKeyValue("appName"; "myFavorite App")
````
Any tags created in the prefs window will be stored on disk in the ``System folder(User preferences_user)`` folder.
<img src="https://github.com/4D-Open-Source/CodeSnippets/blob/main/README_Images/Snippet_preferences.png" width="50%" height="50%">

There are a number of tags that have built-in support:
- {{time}} is replaced with the results of ``String(Current time; HH MM AM PM)`` 
- {{date}} is replaced with the results of ``String(Current date; Internal date short)`` 
- {{timestamp}} is replaced with the results of ``String(Current date; Internal date short) + " " + String(Current time; HH MM AM PM)`` 
- {{methodName}} is replaced with the text that is to the right of the ":" in the title of the current window.

Normally you would do this as part of your startup code. For example:
```
If (Not(Is compiled mode))
	Snippet_SetKeyValue("appName"; "myFavorite App")
	Snippet_ShowSelectorWindow
End if 
```
