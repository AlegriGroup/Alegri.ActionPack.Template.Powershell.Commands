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
function Start-AP_Template_FirstAction
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$true, ValueFromPipelineByPropertyName=$true,Position=0)]
        [System.Xml.XmlLinkedNode]$xmlActionObject
	)
    Begin
    {
		Write-Host "Start Start-AP_Template_FirstAction"    
    }
    Process
    {
          Write-Host "You have Start the First Action" -ForegroundColor DarkGreen -BackgroundColor White
		  Use-AP_Template_ActionFlow_Create-QuestionTask -statement "Only for Demonstration"
		  Write-Host "The XML $($xmlActionObject)"		 
	}
    End
    {
		Write-Host "End Start-AP_Template_FirstAction"
    }
}
