// Last modified: 2022/08/29 09:46:53
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

# Install GCPW - St. Mark School
function AOB-Install-GCPW-st-mark {
    wget "https://raw.githubusercontent.com/olesek/powershell/main/sites/st-mark/gcpwstandaloneenterprise64.exe" -outfile "c:\ps\gcpwstandaloneenterprise64.exe";cd c:\ps;./gcpwstandaloneenterprise64.exe
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
    |                                                          |
    |  Install Google Credential Provider for Windows (GCPW)   |
    |                                                          |
    +==========================================================+
    |          Choose a school for GCPW installation:          |
    |                                                          |
    |    1) * Monsignor Slade Catholic School                  |
    |    2) St. John Regional                                  |
    |    3) St. Mark School                                    |3
    |    4) * St. Philip Neri                                  |
    |    5)                                                    |
    |    6)                                                    |
    |    7)                                                    |
    |    8) RETURN TO MAIN MENU                                |
    |                                                          |              
    |    * = GCPW script insallation not currently avaible     |
    +==========================================================+
"@
Write-Host Last modified
Write-Host Last modified
    
    $MENU = Read-Host "OPTION"
    Switch ($MENU) {
        1 {
          
        }
        2 {
              # Install GCPW - St. John Regional Catholic School
              $OPTION1 = AOB-Install-GCPW-sjrcs
              Write-Host "You are installing GCPW on this PC for St. John Regional Catholic School"
              AOB-Install-GCPW-sjrcs
              Start-Sleep -Seconds 2
              DisplayMenu
        }
        3 {
            # Install GCPW - St. Mark School
            $OPTION4 = AOB-Install-GCPW-st-mark
            Write-Host "You are installing GCPW on this PC for St. Mark Catholic School"
            AOB-Install-GCPW-st-mark
            Start-Sleep -Seconds 2
            DisplayMenu
        }
        4 {
            
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
           
        }
        8 {
            #OPTION8 - EXIT
            Write-Host "Returning to Main Menu"
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

