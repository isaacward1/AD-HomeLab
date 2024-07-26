# Config DHCP Server Role
Import-Module DhcpServer

$DNS_Root = (Get-ADDomain | select dnsroot).dnsroot
$compName_DC = $(Get-ADDomainController | select hostname).hostname
$Priv_IP = "172.16.0.2"

Add-DhcpServerInDC -DnsName $DNS_Root -IPAddress $Priv_IP
Set-DhcpServerv4OptionValue `
    -DnsServer $Priv_IP `
    -DnsDomain $DNS_Root `
    -ComputerName $compName_DC `
    -Router $Priv_IP

Add-DhcpServerv4Scope `
    -ComputerName $compName_DC `
    -Name "172.16.0.100-200" `
    -StartRange "172.16.0.100" `
    -EndRange "172.16.0.200" `
    -SubnetMask "255.255.255.0"