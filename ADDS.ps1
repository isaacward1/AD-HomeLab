# Install ADDS, DHCP, and RRAS Roles onto the server
Import-Module ServerManager
Install-WindowsFeature -ConfigurationFilePath $env:userprofile\Desktop\Auto-AD\Roles.xml

# Promote Windows Server machine to Domain Controller
Import-Module ADDSDeployment

Write-Host "
Creating AD Forest..." -ForegroundColor Cyan 
$domRootName = (read-host "Root domain name (ex: mydomain.com)")
$netBIOSName = $domRootName.Split(".")[0]
Write-host "
* DSRM Admin password default: 'Safemodepass1'
(This can be changed later with ntdsutil)
" -ForegroundColor Cyan

Install-ADDSForest `
    -SafeModeAdministratorPassword (ConvertTo-SecureString "Safemodepass1" -AsPlainText -Force) `
    -CreateDnsDelegation:$false `
    -DomainName $domRootName `
    -DomainMode "WinThreshold" `
    -ForestMode "WinThreshold" `
    -DomainNetbiosName $netBIOSName `
    -InstallDns `
    -NoRebootOnCompletion:$false `
    -Force:$true

Write-Host "
Preparing to reboot..." -ForegroundColor Cyan