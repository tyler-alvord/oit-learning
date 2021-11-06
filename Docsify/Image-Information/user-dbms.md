# Using Maria DB (DBMS)

## What is the MariaDB Image?
|||
|-|-|
| ![](../img/mariadb-logo.png ':no-zoom') | This image contains a configured version of MariaDB. It will be useful for you when you want to query live data, or if you want to create a database with non-persistant data for testing. |

## How to use the MariaDB Image
The system can be accessed directly by logging in with the credentials that are listed below. Alternatively, you can set this up for external access by assigning an external ip address within the network settings in OpenStack

[See "Adding an External IP"](/Openstack-Information/add-external-ip.md)

## Standards
### OS Login 
|               |          |
|---------------|----------|
| **Username:** | oit      |
| **Password:** | owl@dm!n |  

### Data
The DBMS image will contain the default "employees" test database that can be found in the following Git:

[Test_DB Database](https://github.com/datacharmer/test_db)

This will create the following tables and populate it with data:

| **Table Name** | **Record Count** | **Description**                                                                                                         |
|----------------|:----------------:|-------------------------------------------------------------------------------------------------------------------------|
| employees      | 300,024          | Contains all individual employee records.                                                                               |
| departments    | 9                | Contains all individual department records.                                                                             |
| dept_manager   | 24               | Associates Department Leads with their employee record                                                                  |
| dept_emp       | 331,603          | Associates Departments with the employees that work in them - including some users that belong in multiple departments. |
| titles         | 443,308          | Contains the current and past titles for each employee                                                                  |
| salaries       | 2,844,047        | Includes past and present salary information for each employee                                                          |

For more information regarding the Employees database, see the MySQL Documentation here:

[Employee Sample Database Documentation](https://dev.mysql.com/doc/employee/en/)