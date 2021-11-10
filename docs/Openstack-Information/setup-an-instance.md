# Setup an instance in Openstack
<!--Maybe record a video for this one?-->
?> Before you create your first instance, make sure that you have created the first router for your project - see the ["Initial Network Setup Guide"](/Openstack-Image/initial-network-setup.md) for details.

## Creating an Instance  {docsify-ignore}
![](../img/launch-instance.png)
1. Select the `Instances` menu under the `Compute` drop down within the `Project` header on the right side menu
2. Click  `Launch Instance` in the top right corner 
3. Fill in the Details Section
    * Enter a name for the instance that you want to create
    * Add a description if you like - an explanation of what you're using the image for could be useful
4. Click the `source` tab
    * Ensure that `No` is selected as the response for the "Create New Volume" prompt
    * Select the image that you want to use for your instance
5. Click the `flavor` tab
    * Select the [flavor](/Openstack-Information/getting-started?id=flavors) that you want to allocate for your instance
6. Click the `networks` tab
    * Add an internal network to your instance
* To change the default security group
    1. Click on the `Security Groups` tab
    2. Remove the "Default" security group (permissions adhere to Principles of Least Privilege - explicit denies will override everything and explicit allows will override implicit deny)
7. Click `lanch instance` button
8. Done! You can now [access your instance](/Openstack-Information/accessing-an-instance.md)

?> Once you have started your new instances, it's generally recommended that you run through some basic OS updates to make sure that you're on the latest versions of all included components. 

<!--Maybe add the option to change security groups?-->