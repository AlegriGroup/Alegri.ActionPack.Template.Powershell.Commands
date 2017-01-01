#
# DependentFunction.ps1
#

function Use-AP_Template_PnPFunc_GetSPOContext
{
    [CmdletBinding()]
    param
    ()
    Begin
    {
         Write-Verbose "Use-AP_Template_PnPFunc_GetSPOContext Begin" 
    }
    Process
    {
        return "Congratulations You have called a dependent function"  
    }
    End
    {
		Write-Verbose "Use-AP_Template_PnPFunc_GetSPOContext End"
    }
}

function Use-AP_Template_ActionFlow_Create-QuestionTask
{
	[CmdletBinding()]
    param
    (
		[Parameter(Mandatory=$true, ValueFromPipelineByPropertyName=$true,Position=0)]
		$statement	
	)
    Begin
    {
         Write-Verbose "Use-AP_Template_ActionFlow_Create-QuestionTaskBegin" 
    }
    Process
    {
        Create-QuestionTask -statement $statement  #Implement in AlegriActionFlow Tool  
    }
    End
    {
		Write-Verbose "Use-AP_Template_ActionFlow_Create-QuestionTask End"
    }
}