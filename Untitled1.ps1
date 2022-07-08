$SearchUpdates = dism /online /get-packages | findstr "Package_for"
$updates = $SearchUpdates.replace("Package Identity : ", "") | findstr "KBXXXXXX"
#$updates
DISM.exe /Online /Remove-Package /PackageName:$updates /quiet /norestart