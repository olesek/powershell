$updates

Get-Command -Module PSWindowsUpdate
if (PSWindowsUpdate -eq false) {
    "whops"
}