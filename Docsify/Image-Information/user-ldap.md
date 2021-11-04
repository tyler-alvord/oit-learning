# Using Lightweight Directory Access Protocol Server (LDAP)

---
## What is the LDAP Image
The LDAP image is a pre-configured LDAP Server, complete with users, groups, and organizational units. The LDAP server is running LDAP-Utils, Slapd (OpenLDAP), and PHP LDAP admin for web-based administration. 

---
## How to use the LDAP Image
The LDAP server can be used however you want, but it was built with the following goals:
* To be used as an LDAP endpoint for external applications
    * EXAMPLE: installing a test network application and configuring a sync with LDAP
    * EXAMPLE: configuring a linux box to authenticate users with LDAP
    * EXAMPLE: testing external LDAP integration with an application that you're developing
* To gain an understanding of LDAP standards and configurations
    * EXAMPLE: creating and managing users, groups, and organizational units
    * EXAMPLE: configuring LDAP endpoint and server settings
    
### Accessing the PHP LDAP Admin Webpage
1. Navigate to  http://{server-ip}/phpldapadmin 
2. Sign in using the admin credentials below (in the "Standards" section, under the "LDAP Web Admin login")
3. Click the `+` button next to the entry 'dc=lab,dc=pdx,dc=oit,dc=edu' on the left side bar to expand the DC

### Creating a User
1. Select the OU under the parent "Users" OU that you want to add the user to (see user info below for more information about directory structure)
?> It is important to select the organizational unit. You *can* create a child object within a CN object, but it is not recommended
2. Click `Create Child Entry`
3. Select `Generic:User Account` 
4. Enter whatever information that you want to use for the user. 
5. Click `Create Object` and confirm the creation of the account

### Creating an LDAP Group
1. Click the `create new object` under the "Groups" OU
2. Select `Generic: Posix Group`
2. Name the group and click `Create Object` and confirm the creation of the group

### Creating Organizational Units
1. Select the object that you want to create the Organizational Unit under
2. In the menu for the object that you selected, click `create child entry`
3. Select `Generic: Organizational Unit`
4. Name the new Organizational Unit
5. Click `create object` and confirm the creation of the OU

Don't worry about the structure of this! Feel free to experiment with the structure as much as you want - heck, you can even delete the whole schema if you want!

---
## Standards
### OS Login 
|               |          |
|---------------|----------|
| **Username:** | oit      |
| **Password:** | owl@dm!n |  

### LDAP Admin Login 
|               |                                      |
|---------------|--------------------------------------|
| **Username:** | cn=admin,dc=lab,dc=pdx,dx=oit,dx=edu |
| **Password:** |                owl@dm!n              | 

### LDAP User Format
EXAMPLE: The user Bob Johnson would have the following login:

|               |          |
|---------------|----------|
| **Username:** | bjohnson |
| **Password:** | bjohnson | 

All users are created with the first-initial followed by last name for their username and password. This should allow you to log into any of the user accounts that you want should you use this endpoint as an authentication source. 

The following URI's are added to the server to listen on:
||
|-|
| ldap://ldap.lab.pdx.oit.edu |
| ldap://localhost |

Communications are fostered on the standard LDAP port (636)

## Additional Resources
[OpenLDAP Admin Guide](https://www.openldap.org/doc/admin24/)

[A TON of LDAP RFC Documents](https://ldapwiki.com/wiki/LDAP%20Server%20Standards%20and%20Specifications)

[PHPLDAPAdmin Documentation](http://phpldapadmin.sourceforge.net/wiki/index.php/Main_Page)



