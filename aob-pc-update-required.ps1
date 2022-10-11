<#$updates

Get-Command -Module PSWindowsUpdate
if (PSWindowsUpdate -eq false) {
    "whops"
}
#>


$updateInfoMsg = "Windows Update Status: `n";

$UpdateSession = New-Object -ComObject Microsoft.Update.Session;
$UpdateSearcher = $UpdateSession.CreateupdateSearcher();
$Updates = @($UpdateSearcher.Search("IsAssigned=1 and IsHidden=0 and IsInstalled=0 and Type='Software'").Updates);
$Found = ($Updates | Select-Object -Expand Title);

If ($Found -eq $Null) {
    $updateInfoMsg += "Up to date";
} Else {
    $Found = ($Updates | Select-Object -Expand Title) -Join "`n";
    $updateInfoMsg += "Updates available:`n";
    $updateInfoMsg += $Found;
}

$updateInfoMsg;