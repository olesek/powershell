do {
    Write-Host "`n============= Pick the Server environment=============="
    Write-Host "`ta. 'P' for the Prod servers"
    Write-Host "`tb. 'T' for the Test servers"
    Write-Host "`tc. 'D for the Dev Servers'"
    Write-Host "`td. 'Q to Quit'"
    Write-Host "========================================================"
    $choice = Read-Host "`nEnter Choice"
    } until (($choice -eq 'P') -or ($choice -eq 'T') -or ($choice -eq 'D') -or ($choice -eq 'Q') )
    switch ($choice) {
       'P'{
           Write-Host "`nYou have selected a Prod Environment"
       }
       'T'{
          Write-Host "`nYou have selected a Test Environment"
       }
       'D'{
           Write-Host "`nYou have selected a Dev Environment"
        }
        'Q'{
          Return
       }
    }