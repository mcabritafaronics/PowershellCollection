#Variables

$autologon = "C:\Temp\autologon"
$username = read-host -prompt "Enter username for autologon"
$domain = read-host -prompt "Enter domain name for autologon"
$password = Read-Host -Prompt "Enter Password in cleartxt"
$FolderName = "c:\temp\autologon"
$FileName = "C:\temp\autologon.exe"
$Url = 'https://download.sysinternals.com/files/AutoLogon.zip' 
$ZipFile = 'C:\Temp\' + $(Split-Path -Path $Url -Leaf) 
$Destination= 'C:\Temp\autologon' 







#Create Extraction folders


if(Get-Item -Path $FolderName -ErrorAction Ignore)
{
   
        Write-Host "Folder Exists"
        #Create new file
        if(Get-Item -Path $FileName -ErrorAction Ignore){
              Write-Host "File already exists"
        }
        else
        {
            New-Item -Verbose $FileName -ItemType File
           
        }
}
else
{
    Write-Host "Folder Doesn't Exists"
    
    #PowerShell Create directory if not exists
    New-Item $FolderName -ItemType Directory
}

#Download autologon


$Url = 'https://download.sysinternals.com/files/AutoLogon.zip' 
$ZipFile = 'C:\Temp\' + $(Split-Path -Path $Url -Leaf) 
$Destination= 'C:\Temp\autologon' 
 
Invoke-WebRequest -Uri $Url -OutFile $ZipFile 
 
$ExtractShell = New-Object -ComObject Shell.Application 
$Files = $ExtractShell.Namespace($ZipFile).Items() 
$ExtractShell.NameSpace($Destination).CopyHere($Files) 
Start-Process $Destination

# Execute Autologon



Start-Process $autologon -ArgumentList $username,$domain,$password



