<h1>Active Directory Home Lab</h1>
A short tutorial on how to set up a basic Active Directory Domain Controller (DC) environment with VMware Workstation. This repository contains PowerShell scripts to speed up the Domain Services deployment and role configuration processes.
<br><br>


<h2>Prerequisites:</h2>

- [VMware Workstation 17 Pro](https://support.broadcom.com/group/ecx/productdownloads?subfamily=VMware%20Workstation%20Pro)
- [Windows Server 2019 ISO](https://www.microsoft.com/en-us/evalcenter/download-windows-server-2019)
- [Windows 10 ISO](https://www.microsoft.com/en-us/software-download/windows10ISO)
<br><br>

<h2>Walkthrough:</h2>

<h4>Creating a private network for the virtual machines </h4>  

1. In VMware Workstation, navigate to Virtual Network Editor via the "Edit" tab
2. Add Network  >  Network name: vmnet2, Type: Host-only  >  Add
3. Select vmnet2  >  Subnet IP: 172.16.0.0, Subnet mask: 255.255.255.0  >  Save

<br>

<h4>Windows Server 2019 VM Setup </h4>

1. VMware Home  >  New Virtual Machine  >  Typical  >  Select "I will install operating system later."  >  OS: MS Windows, Version: Windows Server 2019  > 
Choose a name and location  >  Disk Size: 30GB  >  Finish
2. VMware Library  >  Select the newly created VM  >  "Edit virtual machine settings"  >  Add  >  Network Adapter  >  Select "Network Adapter 2"  >  Network Connection: Custom  >  vmnet2  >  Select "CD/DVD (SATA)"  >  Use ISO image  >  Select the Windows Server 2019 ISO file  >  Save
3. Start VM  >  Choose "Windows Server Standard Eval 2019 (Desktop Experience)"  >  Custom Install
4. Go through the installation process
5. After the install, navigate to the Server Manaer  >  "Configure this local server"  >  IE Enhanced Security Configuration  >  Admins: Off, Users: Off
   * This allows for a direct download of the repo zip file to the VM. Alternatively, the zip file can be transferred to the VM via USB.
6. Then navigate to Internet Explorer  >  Search `https://github.com/isaacward1/AD-HomeLab/archive/refs/heads/main.zip`  >  Save and Extract to the Desktop

7. After extraction of the zip file to the Desktop, run the following commands in PowerShell. Note that the Server Machine will restart multiple times. After each restart, navigate back to PowerShell and run the next script.

         Set-ExecutionPolicy RemoteSigned
         
         $env:userprofile\Desktop\AD-HomeLab-main\AD-HomeLab-main\Setup.ps1
         
         $env:userprofile\Desktop\AD-HomeLab-main\AD-HomeLab-main\ADDS.ps1

         $env:userprofile\Desktop\AD-HomeLab-main\AD-HomeLab-main\DHCP.ps1
   
8. Unfortunately, there is no way to automate the configuration of the RRAS/NAT Server Role. To implement it, follow these steps:

   Server Manager  >  Tools >  Routing and Remote Access  >  Left click the (local) server > Configure and Enable RRAS  >  Network Address Translation (NAT) > Select the network interface with DHCP enabled (Note: Sometimes no interfaces may appear, close and reopen the Setup Wizard) > Finish

<br>

<h4>Windows 10 Client VM Setup </h4>

1. VMware Home  >  New Virtual Machine  >  Typical  >  Select "I will install operating system later."   >  OS: MS Windows, Version: Windows 10 x64  >  Choose a name and location  >  Disk Size: 40GB  >  Customize Hardware  >  Select "Network Adapter"  >  Custom  >  vmnet2  >  Close  >  Finish
2. Start VM  >  Choose "Windows 10 Pro"  >  Custom Install
 
3. Go through the installation process.
4. To test that DNS, DHCP, and NAT functions of the server are working properly: `ping google.com`.

