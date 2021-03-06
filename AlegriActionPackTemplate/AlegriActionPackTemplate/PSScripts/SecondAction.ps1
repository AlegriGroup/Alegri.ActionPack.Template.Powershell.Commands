#
# SecondAction.ps1
#

<#
.Synopsis
Start Action SecondAction
Starte Aktion SecondAction
.DESCRIPTION
Here you start the action SecondAction and perform all necessary tasks
Hier starten Sie Aktion SecondAction und f�hren alle n�tigen Aufgaben durch
.PARAMETER xmlActionObject
An XML element <alg: ActionObject>
Ein XML Element <alg:ActionObject>
#>
function Start-AP_Template_SecondAction
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$true, ValueFromPipelineByPropertyName=$true,Position=0)]
        [System.Xml.XmlLinkedNode]$xmlActionObject
	)
    Begin
    {
		Write-Host "Start Start-AP_Template_SecondAction"    
    }
    Process
    {
          Write-Host "You have Start the Second Action" -ForegroundColor DarkBlue -BackgroundColor Yellow
		  $context = Use-AP_Template_PnPFunc_GetSPOContext #DependentFunction.ps1
		  Write-Host "Example Dependent Function => Context : $($context)"
		  Write-Host "The XML $($xmlActionObject)"		 
	}
    End
    {
		Write-Host "End Start-AP_Template_SecondAction"
    }
}