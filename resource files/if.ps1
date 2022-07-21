<#
$condition = $true
if ( $condition )
{
    Write-Output "The condition was true"
}


# test if condition

Write-Output "Write-Output - The condition was true"

$condition = $true
if ( $condition )
{
    Write-Output "The condition was true"
}

#wget "https://raw.githubusercontent.com/olesek/powershell/main/if.ps1" -outfile "if.ps1"
#get-windowsupdate

Get-WURebootStatus
$value = Get-MysteryValue
if ( 5 -eq $value )
{
    # do something
}
#>

<#
$value = Get-WURebootStatus
Write-Output $value
if ( 5 -eq $true )
{
    Write-Output "true"
}
Write-Output "false"
#>

# Check to see if PSWindowsUpdate is installed
if (Get-Module -ListAvailable -Name "PSWindowsUpdate") {
    Write-Host "Module exists"
} 
else {
    Write-Host "Module does not exist"
}

# Show Time


# Show Date