# Learning the basics of Openstack
<!--This should explain what the concept of "project" is, what their first steps should be, and some of the basic components of openstack-->
Openstack has a ton of overlap with common cloud provider services like Google Cloud Platform, Amazon AWS, and Micorosft Azure Compute. This document will aim to equip you with some awareness about what's under the hood, how it's similar to common cloud platforms and the terms they use, and some basic information that you may find useful to get into using and understand Openstack!

The expectation for this document is ***not*** for you to read it start to finish, but rather use the sidebar to navigate to quick answers to your questions as they come up. 

## Definitions and Explanations
### Projects
Openstack leverages the concept of "projects" to keep instances separate from one another. A project is a bucket for resources that has its own independent networks, policies, images, instances, credentials, and resource allocations. 

Projects can be associated with invidual user accounts or groups of user accounts. In the traditional deployment of Openstack, this is to allow you to build Applications and services into their own independent infrastructure. This greatly improves security, and scalability, and organization - since administrators can independently associate permissions with users per project, and users of a project don't have to worry about another app or computer affecting the functionality of their project. 

In this implementation, Projects are used to create a private environment for student testing. Programmatic integration with the platform is still available for users, but it is not the primary objective of the system, unlike the objectives of many of the production deployments of Openstack. 

By default, students are assigned their own project with its own allocation of compute resources. If a student needs to access resources for a project that are greater than the default allocation, administrators can provide a temporary project with high allocations. Similarly, if a student needs to other students access to their project (to manage and create instances collaboratively), administrators can create a temporary project and provide access to all required student accounts. 

Think of projects as sandboxes for ***instances*** to occupy. 


### Instances
***Instances*** are Virtual Machines within the Openstack environment. They are standalone computers with their own OS, allocated resources, and access. Thing of these as you would any other virtual machine from any other provider (VirtualBox, Hyper-V, etc). ***Instances*** are built off of ***images***. 

### Images
***Images*** are a point-in-time configuration of a system. Images are static and will not change after they are added to the Openstack system. Traditionally, this is to enable rapid provisioning of computers with a common configuration for scalability. In this implementation, it's leveraged to give users a known-good configuration to rapidly get in and use preconfigured desktop environments. Each of the pre-created images are documented in the ["Image Information" section](/Image-Information/user-base.md) of this manual.

Any changes that are made within an ***instance*** built off a given  ***image*** will not persist after the ***instance*** is destroyed. 

---
### Important services in Openstack
Openstack has many different independently running services that make up its overall functionality. Below are a few of the services that will be useful to know.

For more information about this, check out the ["Openstack Components"](https://www.openstack.org/software/project-navigator/openstack-components#openstack-services) page on the Openstack website. 

| Service | Description |
|-|-|
| **Neutron** | Neutron orchestrates all of the networking components within Openstack. It is responsible for internal routing of project traffic, virtualizing routers, applying Security Groups to machines, and facilitating communications with the external network. This one is probably the component you will interact with at the most technical level, so be sure to check out the ["Learn Neutron Networking"](/Openstack-Information/understanding-networking.md) page for a bit more information. |
| **Nova** | Nova is a compute service that orchestrates the virtualization components for Openstack |
| **Keystone** | Keystone is the authentication component for *all* of Openstack's services. Anything that is done within Openstack will check in with Keystone first to authenticate the account that is trying to do something. |
| **Horizon** | Horizon is the Web-UI of the system. All of the functionality of Openstack could be done through the command line interface, but Horizon provides an intuitive UI to make the system more usable. It listens on Port 80 |
| **Cinder** | Cinder is the Block Storage Manager for Openstack. If your instance needs a volume associated with it, this is the service that creates and manages that volume. |
| **Placement** | Keeps track of the resources available across all Openstack Nodes, helps schedule the images to use hardware efficiently. |
| **Glance** | Glance creates, stores, and tracks the images that are available for Nova to boot off of. Glance adds a layer of abstraction between accessing the image, and the storage the images reside on. By default, this just stores images within the local filesystem, but it can be configured to utilize external backends like Openstack's native Swift Object Storage. This system uses the default backend (local filesystem) |

## Useful User Info
* Usernames should always be set to your student email. Passwords can be reset by administrators if you need. 
* Login will automatically route you to the correct project. If you have access to multiple projects, you can select which project you're working in from the project drop down in the very top left of the UI
* Users are limited to the following resource allocation by default:
|||
|-|-|
| Instances | 3 |
| RAM | 3072 |
| Volumes | 10 |
| Snapshots | 10 |
| Total Storage | 10 GB |

## Additional Resources
[Openstack Wallaby Documentation (Current version of 10/2021)](https://docs.openstack.org/wallaby/index.html)