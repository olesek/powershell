# PC Install Script!

# *********************
# Note: ExecutionPolicy MUST be set in PowerShell to "RemoteSigned" = "A"
# Run "Set-ExecutionPolicy -ExecutionPolicy RemoteSigned" as administrator and selcet "A"
# *********************

# https://www.powershellgallery.com/

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

# Install Winget
Install-Module -Name WinGet

# Install Winget Packages
winget install mozilla.firefox
winget install google.chrome

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
