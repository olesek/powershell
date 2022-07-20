# Update PC
Install-PackageProvider -Name NuGet -Force
Install-Module -Name PSWindowsUpdate -Force
Import-Module PSWindowsUpdate
Get-Command -Module PSWindowsUpdate
Get-WindowsUpdate
Get-WURebootStatus
Install-WindowsUpdate -AcceptAll -AutoReboot

