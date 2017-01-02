#
# AP_Template.ps1
#

#If you want to create default folders for your action package, please comment on the section
#Kommentieren Sie den Bereich ein, wenn Sie vor haben für Ihr Aktionspaket Standard Ordner anzulegen 
#$Global:AP_Template_Folder_ImportantExample = "$env:USERPROFILE\Documents\ActionFlow\AP_Template\ImportantExample"

# All Global Variable where use in this Package and is released from the outside for use
# $Global:AP_Template_MyGlobalVariable = $null

# Allows you to bind all scripts into one function call of an action
# Hiermit binden Sie alle Scripte in die jeweils eine Funktionsaufruf einer Aktion enthält
. "$PSScriptRoot\DependentFunction.ps1"
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
function Find-ActionInAP_Template
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
		Write-Verbose "Start Find-ActionInAP_Template"     
    }
    Process
    {
          switch($actionName)
		  {
			"AP_Template_FirstAction" { $returnValue = $true }
			"AP_Template_SecondAction" { $returnValue = $true }
			default { $returnValue = $false }
		  }

		  return $returnValue
    }
    End
    {
		Write-Verbose "End Find-ActionInAP_Template"
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
function Start-ActionFromAP_Template
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$true, ValueFromPipelineByPropertyName=$true,Position=0)]
        [System.Xml.XmlLinkedNode]$xmlAction
	)
    Begin
    {
        Write-Verbose "Start Start-ActionFromAP_Template"
    }
    Process
    {
		$actionName = $xmlAction.ActionObject.FirstChild.LocalName

		switch($actionName)
		{
			"AP_Template_FirstAction" { Start-AP_Template_FirstAction -xmlActionObject $xmlAction.ActionObject.AP_Template_FirstAction }
			"AP_Template_SecondAction" { Start-AP_Template_SecondAction -xmlActionObject $xmlAction.ActionObject.AP_Template_SecondAction }
		}

		Write-Host "Action : $($actionName) is ready" -ForegroundColor Green
		Write-Host ""
    }
    End
    {
		Write-Verbose "End Start-ActionFromAP_Template"
    }
}

function Check-ExistFolderInAP_Template
{
    <#
    .SYNOPSIS
    Check if the StandardFolder Exists
	Überprüfen Sie, ob der StandardFolder vorhanden ist
    .DESCRIPTION
	When the module is loaded, it is checked whether the default folders are available. If not, the folders are created accordingly.
    Beim Laden des Moduls wird überprüft ob die Standardordner vorhanden sind. Falls nicht werden die Ordner entsprechend angelegt.
    #>
    begin
    {
        Write-Verbose "Begin Check-ExistFolderInAP_Template"
    }
    process
    {
		#Check if Standard folders exist / Prüfe ob Standard Ordner existieren
		$folder1 = $Global:AP_Template_Folder_ImportantExample
		$checkFolder1 = Test-Path $folder1

        if (!$checkFolder1)
        {
            Write-Host "Standard-Folder from Action Pack $($Global:ActionPackageName) must be created" -ForegroundColor Magenta

			if(!(Test-Path $folder1)) #System
			{
                New-Item "$folder1" -ItemType directory | Out-Null   #System
                Write-Host "$folder1 are created" -ForegroundColor Green
            }
        }
		else 
		{
			Write-Host "Standard-Folder from Action Pack $($Global:ActionPackageName) are exist" -ForegroundColor Green
		}
    }
    end
    {
        Write-Verbose "End Check-ExistFolderInAP_Template"
    }    
}
