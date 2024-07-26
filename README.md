<h1>Active Directory Virtual Home Lab</h1>
A guide on how to setup a basic Active Directory client-server environment with VMware Workstation. In this repository, I've included some PowerShell scripts 
to facilitate the Domain Services deployment process as well as role configuration.
<br><br>


<h2>Prerequisites:</h2>

- VMware Workstation 17 Pro
- [Windows Server 2019 ISO](https://www.microsoft.com/en-us/evalcenter/download-windows-server-2019)
- [Windows 10 ISO](https://www.microsoft.com/en-us/software-download/windows10ISO)
<br><br>

<h2>Walkthrough:</h2>

<h4> 1. Creating a private network for the virtual machines </h4>  

- Virtual Network Editor > Add Network > Network name: vmnet2, Type: Host-only > Add
- Select vmnet2 > Subnet IP: 172.16.0.0, Mask: 255.255.255.0 > Save
<br>

<h4> 2. Windows Server 2019 VM Setup </h4>

- New Virtual Machine > Select "I will install operating system later." > MS Windows, Windows Server 2019 > Choose a name and location > Disk Size: 30GB > Customize Hardware > Add > Network Adapter
- Select "Network Adapter 2" > Custom > vmnet2
- Select "CD/DVD (SATA)" > Use ISO image > Select the Windows Server 2019 ISO file > Close > Finish
- Start VM > Choose "Windows Server 2019 (Desktop Experience)" > Type of installation: Custom
- Download/Extract the zip file to the Desktop

- As Administrator, run the following commands in PowerShell

      Set-ExecutionPolicy RemoteSigned
      
      $env:userprofile\Desktop\Auto-ADDS\Stage1.ps1
      
      $env:userprofile\Desktop\Auto-ADDS\Stage2.ps1
<br>

<h4> 3. Windows Client 10/11 VM Setup </h4>

- New Virtual Machine > Select "I will install operating system later." > MS Windows, Windows Server 2019 > Choose a name and location > Disk Size: 30GB > Customize Hardware > Add > Network Adapter
- Select "Network Adapter 2" > Custom > vmnet2 > Close > Finish
- Select Windows Pro or Enterprise version during install
- Download/Extract the zip file to the Desktop
<br>

<h4> 4. Running scripts on Server </h4>

