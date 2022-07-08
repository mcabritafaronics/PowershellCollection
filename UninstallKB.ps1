

wmic qfe list | Out-GridView
$Read_KB = read-host -Prompt "Enter KB#, without KB"
wusa /uninstall /kb:$Read_KB