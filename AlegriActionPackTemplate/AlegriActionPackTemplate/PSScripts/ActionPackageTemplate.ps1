#
# ActionPackageTemplate.ps1
#

# Allows you to bind all scripts into one function call of an action
# Hiermit binden Sie alle Scripte in die jeweils eine Funktionsaufruf einer Aktion enthält
. "$PSScriptRoot\FirstAction.ps1"
. "$PSScriptRoot\SecondAction.ps1"

# You should register a new function in the two lower functions.
# Sie sollten eine neue Funktion in den beiden unteren Funktionen registrieren. 

<#.Synopsis
.DESCRIPTION
Here is checked if there is the action
Hier wird geprüft ob es die Aktion gibt
.PARAMETER actionName
The name of the action
Der Name der Aktion
#>
function Find-ActionInActionPackageTemplate
{
    [CmdletBinding()]
    [OutputType([bool])]
    param
    (
        [Parameter(Mandatory=$true, ValueFromPipelineByPropertyName=$true,Position=0)]
        [string]$actionName
	)
    Begin
    {
		Write-Verbose "Start Find-ActionInActionPackageTemplate"     
    }
    Process
    {
          switch($actionName)
		  {
			"AP_Example_FirstAction" { $returnValue = $true }
			"AP_Example_SecondAction" { $returnValue = $true }
			default { $returnValue = $false }
		  }

		  return $returnValue
    }
    End
    {
		Write-Verbose "End Find-ActionInActionPackageTemplate"
    }
}

<#
.Synopsis
Start the action
Start der Aktion
.DESCRIPTION
Here the corresponding action is initiated by calling the corresponding function
Hier wird die entsprechende Aktion angestossen in dem die dazugehörige Funktion aufgerufen wird
.PARAMETER xmlAction
An XML element <alg: ActionObject>
Ein XML Element <alg:ActionObject>
#>
function Start-ActionFromActionPackageTemplate
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$true, ValueFromPipelineByPropertyName=$true,Position=0)]
        [System.Xml.XmlLinkedNode]$xmlAction
	)
    Begin
    {
        Write-Verbose "Start Start-ActionFromActionPackageTemplate"
    }
    Process
    {
		$actionName = $xmlAction.ActionObject.FirstChild.LocalName

		switch($actionName)
		{
			"AP_Example_FirstAction" { Start-FirstAction -xmlActionObject $xmlAction }
			"AP_Example_SecondAction" { Start-SecondAction -xmlActionObject $xmlAction }
		}
    }
    End
    {
		Write-Verbose "End Start-ActionFromActionPackageTemplate"
    }
}