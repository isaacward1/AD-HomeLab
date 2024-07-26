# Configures the server's private adapter
$ifIndex_Private = (Get-NetIPAddress -AddressFamily IPv4 | select IPAddress, InterfaceIndex | Where-Object {$_.IPAddress -like "*172.16.0*"}).InterfaceIndex

Remove-NetIPAddress -AddressFamily IPv4 -InterfaceIndex $ifIndex_Private -ErrorAction SilentlyContinue
New-NetIPAddress -InterfaceIndex $ifIndex_Private -IPAddress "172.16.0.2" -PrefixLength "24"
Set-DnsClientServerAddress -InterfaceIndex $ifIndex_Private -ServerAddresses "127.0.0.1"

# Renames and reboots the server machine
Rename-Computer -NewName "DC-01" -Restart
Write-Host "
Rebooting..." -ForegroundColor Cyan

