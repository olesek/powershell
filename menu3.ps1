# This script originated from:
# https://techexpert.tips/powershell/powershell-creating-user-menu/
<#
wget "https://raw.githubusercontent.com/olesek/powershell/main/menu3.ps1" -outfile "c:\ps\menu3.ps1"
#>

function AOB-Install-WindowsUpdate {
# Update PC - these commands only need to be run 1 time
Install-PackageProvider -Name NuGet -Force
Install-Module -Name PSWindowsUpdate -Force
Import-Module PSWindowsUpdate
Get-Command -Module PSWindowsUpdate
Get-WindowsUpdate
}
function AOB-Update-Windows {
    # Update PC - these commands only need to be run 1 time
       Get-WindowsUpdate
    }
function vader {
    Get-ChildItem   
}

$reboot = "unknown"

function DisplayMenu {
    Clear-Host
    Write-Host @"
  
    +=================================================+
    |             AOB POWERSHELL CONSOLE              |
    |            REBOOT REQUIRED: $reboot             |
    +=================================================+
    |                                                 |
    |    1) INSTALL WINDOW'S UPDATER                  |
    |       (this option only needs to be run 1 time) |
    |    2) RUN WINDOW'S UPDATER                      |
    |    3) SET PC NAME & TIME ZONE                   |
    |    4) INSTALL GOOGLE CHROME                     |
    |    5)                                           |
    |    6)                                           |
    |    7) DEBUG - type this file                    |
    |    8) EXIT                                      |
    +=================================================+
"@
    
    $MENU = Read-Host "OPTION"
    Switch ($MENU)
    {
    1 {
    #OPTION1 - INSTALL WINDOW'S UPDATER
    $OPTION1 = AOB-Install-WindowsUpdate
    # Test-Connection -ComputerName $OPTION1
    AOB-Install-WindowsUpdate
    Start-Sleep -Seconds 2
    DisplayMenu
    }
    2 {
    #OPTION2 - RUN WINDOW'S UPDATER
    $OPTION2 = AOB-Update-Windows
    # Write-Host "MESSAGE: $OPTION2"
    Start-Sleep -Seconds 2
    DisplayMenu
    }
    3 {
    #OPTION3 - SET PC NAME & TIME ZONE
    $OPTION2 = Read-Host "MESSAGE"
    Write-Host "MESSAGE: $OPTION2"
    Start-Sleep -Seconds 2
    DisplayMenu
    }
    4 {
    #OPTION4 - INSTALL GOOGLE CHROME
    $OPTION2 = Read-Host "MESSAGE"
    Write-Host "MESSAGE: $OPTION2"
    Start-Sleep -Seconds 2
    DisplayMenu
     }
    5 {
    #OPTION5 - EMPTY
    $OPTION2 = Read-Host "MESSAGE"
    Write-Host "MESSAGE: $OPTION2"
    Start-Sleep -Seconds 2
                    DisplayMenu
    }
    6 {
    #OPTION6 - EMPTY
    $OPTION2 = Read-Host "MESSAGE"
    Write-Host "MESSAGE: $OPTION2"
    Start-Sleep -Seconds 2
    DisplayMenu
    }
    7 {
    #OPTION7 - DEBUG
    $OPTION2 = type c:\ps\menu3.ps1
    Write-Host "MESSAGE: $OPTION2"
    Start-Sleep -Seconds 2
    DisplayMenu
    }
    8 {
    #OPTION8 - EXIT
    Write-Host "Bye"
    Break
    }
    default {
    #DEFAULT OPTION
    Write-Host "Option not available"
    Start-Sleep -Seconds 2
    DisplayMenu
    }
    }
    }
    DisplayMenu