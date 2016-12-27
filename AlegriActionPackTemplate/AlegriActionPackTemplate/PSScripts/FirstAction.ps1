#
# FirstAction.ps1
#

<#
.Synopsis
Start Action FirstAction
Starte Aktion FirstAction
.DESCRIPTION
Here you start the action FirstAction and perform all necessary tasks
Hier starten Sie Aktion FirstAction und führen alle nötigen Aufgaben durch
.PARAMETER xmlActionObject
An XML element <alg: ActionObject>
Ein XML Element <alg:ActionObject>
#>
function Start-FirstAction
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$true, ValueFromPipelineByPropertyName=$true,Position=0)]
        [System.Xml.XmlLinkedNode]$xmlActionObject
	)
    Begin
    {
		Write-Host "Start Start-FirstAction"    
    }
    Process
    {
          Write-Host "You have Start the First Action" -ForegroundColor DarkGreen -BackgroundColor White
		  Create-QuestionTask -statement "Only for Demonstration" #Implement in AlegriActionFlow Tool
		  Write-Host "The XML $($xmlActionObject)"		 
	}
    End
    {
		Write-Host "End Start-FirstAction"
    }
}
