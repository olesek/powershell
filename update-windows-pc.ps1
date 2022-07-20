# Run "Set-ExecutionPolicy -ExecutionPolicy RemoteSigned" as administrator and selcet "A"
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned

# Update PC - these commands only need to be run 1 time
Install-PackageProvider -Name NuGet -Force
Install-Module -Name PSWindowsUpdate -Force
Import-Module PSWindowsUpdate
Get-Command -Module PSWindowsUpdate
Get-WindowsUpdate
Get-WURebootStatus

# Update PC - this command updates the PC
Install-WindowsUpdate -AcceptAll -AutoReboot

