# Powershell script to copy a shortcut to all users
$TargetFile = read-host  -Prompt "Location of shortcut's.exe"
$ShortcutFile = read-host -Prompt "Location of shortcut .lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$Shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$Shortcut.TargetPath = $TargetFile
$Shortcut.Save()
