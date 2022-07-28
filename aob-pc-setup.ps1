// Last modified: 2022/07/28 10:46:10

# This script originated from:
# https://techexpert.tips/powershell/powershell-creating-user-menu/
<#
wget "https://raw.githubusercontent.com/olesek/powershell/main/aob-pc-setup.ps1" -outfile "c:\ps\aob-pc-setup.ps1"
#>

# This function will install the Windows update functionality
# These commands only need to be run 1 time

# Set AOB(aob) alias to run this script
Set-Alias aob c:\ps\aob-pc-setup.ps1

function AOB-Install-WindowsUpdate {
    Install-PackageProvider -Name NuGet -Force
    Install-Module -Name PSWindowsUpdate -Force
    Import-Module PSWindowsUpdate
    Get-Command -Module PSWindowsUpdate
    Get-WindowsUpdate
}

# Function to update PC
function AOB-Update-Windows {
    Get-WindowsUpdate
    Get-WURebootStatus
    Install-WindowsUpdate -AcceptAll -AutoReboot
    Install-WindowsUpdate -AcceptAll -Install -AutoReboot
}

function AOB-Install-GoogleChrome {
    #    New-Item -Path 'c:\ps' -ItemType Directory
    #    Set-Location c:\ps
    Invoke-WebRequest -uri 'http://dl.google.com/chrome/install/375.126/chrome_installer.exe' -OutFile "C:\ps\chrome_installer.exe"
    Start-Process "C:\ps\chrome_installer.exe" -ArgumentList "/silent /install" -Wait
}

function AOB-Install-GCPW {
    wget "https://raw.githubusercontent.com/olesek/powershell/main/aob-gcpw.ps1" -outfile "c:\ps\aob-gcpw.ps1";cd c:\ps;./aob-gcpw.ps1
}


# Call GCPW Menu
function AOB-Install-GCPW {
    wget "https://raw.githubusercontent.com/olesek/powershell/main/sites/aob-pc-setup-gcpw.ps1" -outfile "c:\ps\aob-pc-setup-gcpw.ps1";cd c:\ps;./aob-pc-setup-gcpw.ps1

}
function Set-PC-Name-and-TimeZone {
    # Set PC Name
    $pcname = Read-Host "Enter PC Name"
    Rename-Computer -NewName $pcname
    Write-Host pc will be renamed $pcname

    # Set Time Zone
    Write-Host Setting Time Zone to Eastern Standard Time
    Set-TimeZone -Name "Eastern Standard Time"
    Write-Host
    Write-Host "Time Zone set to:" Get-TimeZone 
}

function vader {
    Get-ChildItem   
}

$reboot = "unknown"

function DisplayMenu {
    Clear-Host
    Write-Host @"
  
    +==========================================================+
    |             AOB POWERSHELL CONSOLE                       |
    |            REBOOT REQUIRED: $reboot                      |
    +==========================================================+
    |                                                          |
    |    1) INSTALL WINDOW'S UPDATER                           |
    |       (this option only needs to be run 1 time)          |
    |    2) RUN WINDOW'S UPDATER                               |
    |    3) SET PC NAME & TIME ZONE                            |
    |    4) INSTALL GOOGLE CHROME                              |
    |    5) INSTALL GOOGLE CREDENTIAL PROVIDER FOR WINDOWS     |
    |    6)                                                    |
    |    7) UPGRADE THIS SCRIPT                                |
    |    8) EXIT                                               |
    +==========================================================+
"@
Write-Host // Last modified: 2022/07/26 18:59:53
    
    $MENU = Read-Host "OPTION"
    Switch ($MENU) {
        1 {
            #OPTION1 - INSTALL WINDOW'S UPDATER
            $OPTION1 = AOB-Install-WindowsUpdate
            # Test-Connection -ComputerName $OPTION1
            AOB-Install-WindowsUpdate
            Start-Sleep -Seconds 2
            DisplayMenu
        }
        2 {
            # OPTION2 - RUN WINDOW'S UPDATER
            # $OPTION2 = AOB-Update-Windows
            Write-Host "Checking & Installing Window's Updates"
            AOB-Update-Windows
            Start-Sleep -Seconds 2
            DisplayMenu
        }
        3 {
            #OPTION3 - SET PC NAME & TIME ZONE
            Write-Host "Setting PC Name and TimeZone"
            $OPTION3 = Set-PC-Name-and-TimeZone
            Start-Sleep -Seconds 2
            DisplayMenu
        }
        4 {
            #OPTION4 - INSTALL GOOGLE CHROME
            Write-Host "Installing Chrome"
            $OPTION4 = AOB-Install-GoogleChrome
            # delete - Write-Host "MESSAGE: $OPTION2"
            Start-Sleep -Seconds 2
            DisplayMenu
        }
        5 {
            #OPTION5 - INSTALL GOOGLE CREDENTIAL PROVIDER FOR WINDOWS
            # $OPTION5 = Read-Host "MESSAGE"
            Write-Host "Installing Google Credential Provider for Windows"
            Start-Sleep -Seconds 2
            AOB-Install-GCPW
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
            #OPTION7 - UPGRADE THIS SCRIPT
            $OPTION7 = wget "https://raw.githubusercontent.com/olesek/powershell/main/aob-pc-setup.ps1" -outfile "c:\ps\aob-pc-setup.ps1";c:\ps\./aob-pc-setup.ps1
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

