#
# SecondAction.ps1
#

<#
.Synopsis
Start Action SecondAction
Starte Aktion SecondAction
.DESCRIPTION
Here you start the action SecondAction and perform all necessary tasks
Hier starten Sie Aktion SecondAction und führen alle nötigen Aufgaben durch
.PARAMETER xmlActionObject
An XML element <alg: ActionObject>
Ein XML Element <alg:ActionObject>
#>
function Start-SecondAction
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$true, ValueFromPipelineByPropertyName=$true,Position=0)]
        [System.Xml.XmlLinkedNode]$xmlActionObject
	)
    Begin
    {
		Write-Host "Start Start-SecondAction"    
    }
    Process
    {
          Write-Host "You have Start the Second Action" -ForegroundColor DarkBlue -BackgroundColor Yellow
		  Write-Host "The XML $($xmlActionObject)"		 
	}
    End
    {
		Write-Host "End Start-SecondAction"
    }
}