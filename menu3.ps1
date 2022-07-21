function DisplayMenu {
    Clear-Host
    Write-Host @"
    +===============================================+
    |  POWERSHELL CONSOLE - USER MENU               | 
    +===============================================+
    |                                               |
    |    1) PING                                    |
    |    2) DISPLAY MESSAGE                         |
    |    3) EXIT                                    |
    +===============================================+

"@
    
    $MENU = Read-Host "OPTION"
    Switch ($MENU)
    {
    1 {
    #OPTION1 - PING
    $OPTION1 = Read-Host "HOST"
    Test-Connection -ComputerName $OPTION1
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