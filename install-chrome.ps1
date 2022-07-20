# Install Chrome
# Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass

write-host "Installing Chrome.."
$installer_name = 'chrome'
Invoke-WebRequest -uri 'http://dl.google.com/chrome/install/375.126/chrome_installer.exe' -OutFile "C:\windows\temp\$($installer_name).exe"
Start-Process "C:\windows\temp\$($installer_name).exe" -ArgumentList "/silent /install" -Wait
Remove-Item "C:\windows\temp\$($installer_name).exe" -Force