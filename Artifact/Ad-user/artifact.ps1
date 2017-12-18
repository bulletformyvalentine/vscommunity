[CmdletBinding()]       
param
(
    [Parameter(Mandatory = $true)]
    [string] $DomainJoinUsername
)

function Add-UserToLocalGroup ()
{
    param
    (
        [Parameter(Mandatory = $true)] 
        [string] $Username, 
        
        [Parameter(Mandatory = $true)] 
        [string] $GroupName
    )
    Write-Output "Attempting to add $DomainJoinUsername to the administrators group..."
    $adUser = Get-AdUsernameString $Username
    $group = [ADSI]("WinNT://$env:COMPUTERNAME/$GroupName, group")

    if ($group.IsMember($adUser))
    {
        Write-Output "Result: $Username already belongs to the $GroupName"
        return
    }
    $group.Add($adUser)
    
    if ($group.IsMember($adUser))
    {
        Write-Output "Result: $Username successfully added to $GroupName"
    }
    else
    {
        Write-Error "Result: failed to add $username to $GroupName"
    }
}

$adminGroupName = Get-LocalAdminGroupName
Add-UserToLocalGroup -Username $DomainJoinUsername -GroupName $adminGroupName
Write-Output "Members of $GroupName are:"
Get-LocalGroupMembers $adminGroupName
