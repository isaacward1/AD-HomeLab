<h1> Active Directory Home Lab Tutorial </h1>

<h3>Summary:<br></h3> 
This guide walks you through the steps to set up a simple Active Directory environment w/ Domain Services, a DHCP server, DNS server, and via VMware virtual machines
<br><br>

<h3>Prerequisites:<br></h3>
This lab will assume that you have the following resources:

- VMware Workstation
- [Windows Server 2019 ISO](https://www.microsoft.com/en-us/evalcenter/download-windows-server-2019)
- [Windows 11 ISO](https://www.microsoft.com/software-download/windows11)
- Account Creation Script
<h1></h1>

<h3>Walkthrough<br></h3>
1. Virtual Machine Install and Configuration<br>
In VMware Workstation, In VMware Workstation, In VMware Workstation, In VMware Workstation, In VMware Workstation, In VMware Workstation, 

1. Server Network Interface Setup
VMware network adapters setup
- Setup Windows Server 2019 with 2 Network Adapters (One custom-host-only and one NAT)

![cool](Images/screenshot1.png)




2. Configure Unidentified Adapter
- Change adapter settings > unidentified network properties > IPv4 > 172.16.0.2/24 and DNS of loopback

3. Installing AD Domain Services
- Server Manager > Add Roles and Features > Server Roles (AD Domain Services) > Install

4. Finish Setup of AD DS
- AD DS Configuration > new forest > root domain name ("mydomain.com") > setup password > Install

5. Create an administrative account account
- Windows Admin Tools > Users and Comps > OU ("Admins_List") > New User (username: "a-jtitor") > Password ("Password1") > uncheck must change pass, check never expires > finish

Give admin privs to newly created user:
- Admins_List > john titor > properties > member of > Add > Domain Admins > Sign out

6. Install Remote Access Services for clients to access internet while connected to company domain
- Server manager > add roles/features > Remote Access > Roles service: RAS and Routing > Install

7. Configure RAS (NAT)
- Server manager > Tools > routing and remote access > (local) > configure (NAT) and enable
- select the internet interface > finish

8. Install/Config DHCP Server Role
- Server Manager > Add roles > Server roles > DHCP server > Install
- Tools > DHCP > IPv4 > new scope ("172.16.0.100-200) > Length = 24 > next a bunch of times > finish
- Router = 172.16.0.2
- Authorize and refresh DHCP server

8b. Allow internet to be browsed by server
- Server manager > unselect ie thing

9. PowerShell Add users to AD



Client Side
** windows home cannot join domain, pro or enterprise needed
** Disable/Enable NICs after every network change

1. Configure NIC to use 172.16.0.2 as DNS and Default gateway
2. ping google.com to check for access to the internet and DNS







