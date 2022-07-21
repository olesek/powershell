# This script originated from:
# https://techexpert.tips/powershell/powershell-creating-user-menu/
<#
wget "https://raw.githubusercontent.com/olesek/powershell/main/menu3.ps1" -outfile "c:\ps\menu3.ps1"
#>


function vader {
    Get-ChildItem
    param (
        OptionalParameters
    )
    
}

function DisplayMenu {
    Clear-Host
    Write-Host @"
    +===============================================+
    |  AOB POWERSHELL CONSOLE                       | 
    +===============================================+
    |                                               |
    |    1) Install Window's Updater
            ( (this option only need to be run 1 time))
    |    2) DISPLAY MESSAGE                         |
    |    3) EXIT                                    |
    +===============================================+

"@
    
    $MENU = Read-Host "OPTION"
    Switch ($MENU)
    {
    1 {
    #OPTION1 - PING
    $OPTION1 = vader
    # Test-Connection -ComputerName $OPTION1
    vader
    Start-Sleep -Seconds 2
    DisplayMenu
    }
    2 {
    #OPTION2 - DISPLAY MESSAGE
    $OPTION2 = Read-Host "MESSAGE"
    Write-Host "MESSAGE: $OPTION2"
    Start-Sleep -Seconds 2
    DisplayMenu
    }
    3 {
    #OPTION3 - EXIT
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