<#  .Description
    Pester tests for DRSRule PowerShell module.  Expects that:
    0) DRSRule module is already loaded (but, will try to load it if not)
    1) a connection to at least one vCenter is in place (but, will prompt for XMS to which to connect if not)
    2) there are one or more existing DRS items of each type to test (VMGroup, VMHostGroup, etc.) in the specified cluster

    .Example
    Invoke-Pester -Script @{Path = '\\some\path\DRSRule\testing\DRSRule.Tests_Get_Unit.ps1'; Parameters = @{Cluster = "myFavoriteCluster"}}
    Invokes the tests in said Tests script, passing the given Cluster parameter value, to be used for the cluster-specific tests
#>
param (
    ## Name of the vCenter cluster to use in the DRSRule testing
    [parameter(Mandatory=$true)][string]$Cluster
)

## initialize things, preparing for tests
$oClusterToUse = & $PSScriptRoot\DRSRule.TestingInit.ps1 -Cluster $Cluster
## hashtable of DRSRule object short typename to VMware "real" object full typename info, to be used with -ReturnRawGroup testing
$hshDrsruletypeToVMwareTypeInfo = @{
    VMGroup = "VMware.Vim.ClusterVmGroup"
    VMHostGroup = "VMware.Vim.ClusterHostGroup"
} ## end hsh


## for each of the object types whose typenames match the object name in the cmdlet noun, test getting such an object
$arrObjectTypesToGet = Write-Output VMGroup, VMHostGroup
$arrObjectTypesToGet | Foreach-Object {
    Describe -Tags "Get" -Name "Get-Drs$_" {
        It "Gets a DRSRule $_ object (from any ol' cluster)" {
            $arrReturnTypes = if ($arrTmpObj = Invoke-Command -ScriptBlock {& "Get-Drs$_" | Select-Object -First 2}) {$arrTmpObj | Get-Member -ErrorAction:Stop | Select-Object -Unique -ExpandProperty TypeName} else {$null}
            New-Variable -Name "bGetsOnly${_}Type" -Value ($arrReturnTypes -eq "DRSRule.$_")

            ## gets only the desired object type should be $true
            (Get-Variable -ValueOnly -Name "bGetsOnly${_}Type") | Should Be $true
        }

        It "Gets a 'raw' $($hshDrsruletypeToVMwareTypeInfo[$_]) object (from any ol' cluster), via -ReturnRawGroup" {
            $arrReturnTypes = if ($arrTmpObj = Invoke-Command -ScriptBlock {& "Get-Drs$_" -ReturnRawGroup | Select-Object -First 2}) {$arrTmpObj | Get-Member -ErrorAction:Stop | Select-Object -Unique -ExpandProperty TypeName} else {$null}
            New-Variable -Name "bGetsOnly${_}Type" -Value ($arrReturnTypes -eq $hshDrsruletypeToVMwareTypeInfo[$_])

            ## gets only the desired object type should be $true
            (Get-Variable -ValueOnly -Name "bGetsOnly${_}Type") | Should Be $true
        }

        It "Gets a DRSRule $_ object (from specific cluster, '$oClusterToUse')" {
            $arrReturnTypes = if ($arrTmpObj = Invoke-Command -ScriptBlock {& "Get-Drs$_" -Cluster $oClusterToUse | Select-Object -First 1}) {$arrTmpObj | Get-Member -ErrorAction:Stop | Select-Object -Unique -ExpandProperty TypeName} else {$null}
            New-Variable -Name "bGetsOnly${_}Type" -Value ($arrReturnTypes -eq "DRSRule.$_")
            $bGetsItemFromSpecifiedCluster = $arrTmpObj.Cluster -eq $oClusterToUse.Name

            ## gets only the desired object type should be $true
            (Get-Variable -ValueOnly -Name "bGetsOnly${_}Type") | Should Be $true
            $bGetsItemFromSpecifiedCluster | Should Be $true
        }

        It "Gets a DRSRule $_ object (from specific cluster, '$oClusterToUse', taking cluster from pipeline)" {
            $arrReturnTypes = if ($arrTmpObj = Invoke-Command -ScriptBlock {$oClusterToUse | & "Get-Drs$_" | Select-Object -First 1}) {$arrTmpObj | Get-Member -ErrorAction:Stop | Select-Object -Unique -ExpandProperty TypeName} else {$null}
            New-Variable -Name "bGetsOnly${_}Type" -Value ($arrReturnTypes -eq "DRSRule.$_")
            $bGetsItemFromSpecifiedCluster = $arrTmpObj.Cluster -eq $oClusterToUse.Name

            ## gets only the desired object type should be $true
            (Get-Variable -ValueOnly -Name "bGetsOnly${_}Type") | Should Be $true
            $bGetsItemFromSpecifiedCluster | Should Be $true
        }
    }
}