# Using the SAMBA File Server

## What is the SMB Server Image
|||
|-|-|
| ![](../img/samba-logo.png ':no-zoom') | The SMB Server image is a server running Samba 4.11 to share files and printers on the network (particularly with Windows devices). This server is configured to allow you to experiencing modifying SAMBA shares, working with Linux-native file sharing formats, and configuring printing in a linux environment. This image - alongside the LDAP image - should allow you to create an environment of multiple linux devices that align with what you may see in a small nettwork with a Linux server. |

## How to use the SMB Server Image
### Create or Modify a Samba share 
1. Open the Samba configuration file "/etc/samba/smb.conf" using your text editor of choice
2. Navigate to the bottom of the text file to find the list of the file shares currently published by Samba
3. Create or modify your share settings
    * To *modify an existing* share
        1. Change the share by specifying the location in the "path" value
        2. Modify the permissions if needed 
    * To *create a new* share
        1. At the bottom of the configuration file, add a new comment to distinguish the configuration for this share from the others above it
        2. Below the commented line type the name of the share in square brackets
            * Example: [Samba Share]
        3. Below the share name, type and fill out the following information:
            ```
            comment = A nice lil description for the share
            path = /path/to/file
            read only = yes/no
            guest ok = yes/no
            valid users = user1, user2, user3, @group1, @group2
            ```
            * Note that you can add OS groups to the list by specifying the "@" symbol followed by the name of thr group
4. Write the file out (save your changes)
5. Restart the Samba services with the command `sudo systemctl restart smbd`

### Adjust Samba System Settings
* Main settings for the Samba system can be found in the smb.conf file under the [Global] Header. Restart Services with the command `sudo systemctl restart smbd` to apply changes.
    * For additional experience, you may want to try to get the Samba server setup as a domain controller, or maybe look at the alternate authentication options that you can configure Samba to use.  

### Add Samba Users
1. Add the user to the OS using the command `sudo adduser {username}`
2. Enter the relevant information that you want for the new user
3. Add the user to the groups that you want to by running the command `sudo usermod -a -G {groupname} {username}`
4. Add the user to Samba by running the command `sudo smbpasswd -a {username}` and enter the password for the user's Samba access
5. Enable the user in Samba by running the command `sudo smbpasswd -e {username}` 

### Create and modify printers
?> Note: Due to recent Print Nightmare ([CVE-2021-1675](https://msrc.microsoft.com/update-guide/vulnerability/CVE-2021-1675), [CVE-2021-34527](https://msrc.microsoft.com/update-guide/vulnerability/CVE-2021-34527)), you may not be able to connect to the shared printers from this server. You can instead use this server to get acclimated with CUPS administration if you want. This section covers how to tinker with the printers within CUPS ([Common Unix Printing System](https://www.cups.org/))

1. Within the image instance, open the Firefox web browser and navigate to 127.0.0.1:631. This will open the CUPS web interface. 
    * If you are not able to access this web page, you may need to open up a terminal window and run the following command: `sudo cupsctl WebInterface=yes`
* To *create* a printer
    1. Click "Administration" 
    2. In the administration menu, select "Add Printer" 
    3. Specify your printer's connection information (protocol, connection string, etc), name it (avoiding spaces in the name), and provide a driver 
* To *modify* a printer
    1. Click "Printers"
    2. Click on the printer that you want to modify
    3. Click the "administration" drop down to change configurations
* To *test* a printer
    1. Click "Printers"
    2. Click on the printer that you want to test
    3. Click on the "maintenance" drop down to send test pages, and manage print jobs

### Connecting your Windows Machine to the share
You may find better luck connecting to these instances by using the `net use` command, instead of leveraging the File Explorer's UI to connect. After you've added the share, you should be able to access the files and folders from the File Explorer. 

?> Ensure that you have assigned a floating IP for this instance and that the Security Groups permit inbound access! For more information, check out the [add external IP page](/Openstack-Information/add-external-ip.md)

1. Open a PowerShell or Command Prompt on your machine
2. Type the following command:
    * `net use {DriveLetter}: \\{floating-ip}\{sharename} /user:{username}`
3. Enter the password for the samba user
4. Access your files!

## Standards
### OS Login 
|               |          |
|---------------|----------|
| **Username:** | oit      |
| **Password:** | owl@dm!n |  

### Default Shares
| Parent Directory | Folder Name | Description | Access (Users, Groups) |
|------------------|-------------|-------------|------------------------|
| Misc             | N/A         | Contains miscellaneous files needed for all staff members. | Social Studies Staff, Language Arts Staff, Science Staff, Arts and Music Staff, Math Staff |
| Departments | Language Arts | Contains files designated for the Writing Staff and students | Language Arts Staff, WRI142 Students, WRI201 Students, LIT101 Students, LIT110 Students |
|        | Arts and Music | Contains files designated for the Arts and Music staff and students | Arts and Music Staff, ART102 Students, MH101 Students,  MT110 Students |
|        | Science | Contains files designated for the Science staff and students | Science Staff, GEO210 Students, CHM245 Students, BIO195 Students |
|        | Social Studies | Contains files designated for the Social Studies staff and students | Social Studies Staff, CIV104 Students, EUR201 Students, CIV111 Students CIV 122 Students, USH101 Students | 
|        | Math | There is really only one math class at this school.... I don't know what to say... | Math Staff, Math Students |


## Additional Resources
[Samba HowTo Guide](https://www.samba.org/samba/docs/Samba3-HOWTO.pdf)

[Samba Wiki](https://wiki.samba.org/index.php/Main_Page)

[CUPS Manual](https://www.cups.org/documentation.html)

[Ubuntu CUPS Page](https://ubuntu.com/server/docs/service-cups)

<!--
DOCUMENTATION STANDARDS - ADMIN REFERENCES ONLY

Page titles, headers, and other basic structure
    - Pages should have their title set as the first and only "h1" header 
        - there should be only one header with a single hashmark in front of it
    EXAMPLES:
        Good: # title
              ## content header
        Bad:  # title
              # content header

Referencing other pages or sections by name:
    - page references to web resources should be stated in quotation marks
    EXAMPLE: For more information, check out the "Setup an Instance" page in the "Openstack Information" section of this manual
    EXAMPLE: You can get a little more detail from the "Common Use Cases" Section in the "Getting Started" Section of the ATT&CK Website.

Buttons, menu options, or other openstack UI references:
    -Enclose as a code block 
    EXAMPLE: After entering your information, click the `accept` button to save your progress

Formatting Credentials 
    - Credentials should be in a table format
        - header values empty
        - all values left-justified. 
    - Left column should be used as the ID field for the information stored in the right column
        - ID fields should be bolded (use doulbe-asterisks **)
        - ID fields should end with a colon ":"
    EXAMPLE: 
        |               |                 |
        |---------------|-----------------|
        | **Username:** |   admin         |
        | **Password:** | SuperSecret123! |
    NOTE: If your username or password contains an asterisk, you will need to escape the character


-->
