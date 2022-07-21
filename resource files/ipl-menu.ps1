# PC Install Script!

# *********************
# Note: ExecutionPolicy MUST be set in PowerShell to "RemoteSigned" = "A"
# Run "Set-ExecutionPolicy -ExecutionPolicy RemoteSigned" as administrator and selcet "A"
# *********************

using namespace System.Management.Automation.Host

function New-Menu {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]$Title,

        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]$Question
    )
    
    $red = [ChoiceDescription]::new('&Red', 'Favorite color: Red')
    $blue = [ChoiceDescription]::new('&Blue', 'Favorite color: Blue')
    $yellow = [ChoiceDescription]::new('&Yellow', 'Favorite color: Yellow')

    $options = [ChoiceDescription[]]($red, $blue, $yellow)

    $result = $host.ui.PromptForChoice($Title, $Question, $options, 0)

    switch ($result) {
        0 { 'Your favorite color is Red' }
        1 { 'Your favorite color is Blue' }
        2 { 'Your favorite color is Yellow' }
    }

}




# Clear Terminal Window
Clear

# Set PC Name
$pcname = Read-Host "Enter PC Name"
Rename-Computer -NewName $pcname
Write-Host pc will be renamed $pcname

# Set Time Zone
Write-Host Setting Time Zone to Eastern Standard Time
Set-TimeZone -Name "Eastern Standard Time"
Write-Host
Write-Host Time Zone set to:
Get-TimeZone
read-host Ready to begin Inital Program Load - Press ENTER to continue...

# Update PC
Install-Module -Name PSWindowsUpdate -Force
Import-Module PSWindowsUpdate
Get-Command -Module PSWindowsUpdate
Get-WindowsUpdate
Get-WURebootStatus
Install-WindowsUpdate -AcceptAll -AutoReboot

# Install Google Chrome
write-host "Installing Chrome.."
$installer_name = 'chrome'
Invoke-WebRequest -uri 'http://dl.google.com/chrome/install/375.126/chrome_installer.exe' -OutFile "C:\windows\temp\$($installer_name).exe"
Start-Process "C:\windows\temp\$($installer_name).exe" -ArgumentList "/silent /install" -Wait
Remove-Item "C:\windows\temp\$($installer_name).exe" -Force

# Install Google Credential Provider for Windows
C:\Users\techadmin\Desktop\ipl\.\InstallGCPW.ps1

# Install Google Chrome
C:\Users\techadmin\Desktop\ipl\.\InstallChrome.ps1

# Install Simple Help
C:\Users\techadmin\Desktop\ipl\.\"Remote Access-windows64-online.exe"

Write-Host ALL DONE!!!
