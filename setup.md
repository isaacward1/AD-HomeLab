<h1>Prerequisites:</h1>
<br>

- VMware Workstation
- [Windows Server 2019 ISO](https://www.microsoft.com/en-us/evalcenter/download-windows-server-2019)
- [Windows 10 ISO](https://www.microsoft.com/en-us/software-download/windows10ISO)
<br>

<h1>Walkthrough:</h1>
<br>

<h3>1. Create a private Server-Client network for VMs</h3>

- Virtual Network Editor > Add Network > Network name: vmnet2, Type: Host-only > Add
- Select vmnet2 > Subnet IP: 172.16.0.0, Mask: 255.255.255.0 > Save
<br>

<h3>2. Windows Server 2019 VM Setup</h3>

- New Virtual Machine > Select "I will install operating system later." > MS Windows, Windows Server 2019 > Choose a name and location > Disk Size: 30GB > Customize Hardware > Add > Network Adapter
- Select "Network Adapter 2" > Custom > vmnet2
- Select "CD/DVD (SATA)" > Use ISO image > Select the Windows Server 2019 ISO file > Close > Finish
- Start VM > Choose "Windows Server 2019 (Desktop Experience)" > Type of installation: Custom
- Download/Extract the zip file to the Desktop

<br>

<h3>3. Windows Client 10/11 VM Setup</h3>

- New Virtual Machine > Select "I will install operating system later." > MS Windows, Windows Server 2019 > Choose a name and location > Disk Size: 30GB > Customize Hardware > Add > Network Adapter
- Select "Network Adapter 2" > Custom > vmnet2 > Close > Finish
- Select Windows Pro or Enterprise version during install
- Download/Extract the zip file to the Desktop
<br>

