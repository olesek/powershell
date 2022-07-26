// Last modified: 2022/07/26 18:20:12
Write-Host Last modified

# This script originated from:
# https://techexpert.tips/powershell/powershell-creating-user-menu/
<#
wget "https://raw.githubusercontent.com/olesek/powershell/main/aob-pc-setup.ps1" -outfile "c:\ps\aob-pc-setup.ps1"
#>


function AOB-Update-Windows {
    # Update PC - these commands only need to be run 1 time
    Get-WindowsUpdate
}



# Install GCPW - St. John Regional Catholic School
function AOB-Install-GCPW-sjrcs {
    wget "https://raw.githubusercontent.com/olesek/powershell/main/sites/sjrcs/gcpwstandaloneenterprise64.exe" -outfile "c:\ps\gcpwstandaloneenterprise64.exe";cd c:\ps;./gcpwstandaloneenterprise64.exe
}


<#
https://github.com/olesek/powershell/tree/main/sites/sjrcs
#>



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
    |AOB POWERSHELL CONSOLE
    | Google Credential Provider for Windows (GCPW)                       |
    |                           |
    +==========================================================+
    | Choose the school you would like to install GCPW for:          
                                                    |
    |    1) St. John regional Catholic School                  |
    |    2) Monsignor Slade Catholic School                              |
    |    3) St. Philip Neri Catholic School                           |
    |    4) INSTALL GOOGLE CHROME                              |
    |    5) INSTALL GOOGLE CREDENTIAL PROVIDER FOR WINDOWS     |
    |    6)                                                    |
    |    7) UPGRADE THIS SCRIPT                                |
    |    8) EXIT                                               |
    +==========================================================+
"@
Write-Host Last modified
Write-Host Last modified
    
    $MENU = Read-Host "OPTION"
    Switch ($MENU) {
        1 {
            # Install GCPW - St. John Regional Catholic School
            $OPTION1 = AOB-Install-GCPW-sjrcs
            
            AOB-Install-GCPW-sjrcs
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
            Start-Sleep -Seconds 10
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

