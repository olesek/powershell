clear
$a=Read-Host -Prompt "
`n1. Show day of the week
`n2. Show year
`n3. Check for updates
`nPlease select an option"
switch ($a){
    1{Get-Date -UFormat %A}
    2{Get-Date -UFormat %Y}
    3{Install-WindowsUpdate -AcceptAll -AutoReboot}
}

Write-Host $a