$Global:ActionPackageName = "Template"

. "$PSScriptRoot\PSScripts\AP_Template.ps1"

Write-Host "Alegri Action Package $($Global:ActionPackageName) are ready" -ForegroundColor Green

#If you want to create default folders for your action package, please comment on the section
#Kommentieren Sie den Bereich ein, wenn Sie vor haben f�r Ihr Aktionspaket Standard Ordner anzulegen 
#Check-ExistFolderInAP_Template #AP_Template