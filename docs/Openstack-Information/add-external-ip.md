# Add an external IP address
Openstack doesn't allow you to add an external IP address directly to the host (as in, assigning an IP from the external network to a Network Interface Card on the guest). Instead, you can leverage 1:1 Network Address Translation to provide inbound external access to the Guests within Openstack. This feature is called "Floating IP"

**Floating IP addresses are not required to give your instance *outbound* access to the internet** - that can be done with standard internal network addresses (see ["Learn Neutron Networking"](/Openstack-Information/understanding-networking.md) for more detail about internal vs Floating IP addresses). Floating IP addresses are only required if you want to communicate to the instance from the external network - for example, from another app on your computer.

## Add a floating IP From the Intances Menu
> This will need an instance to associate the address with. If you don't have an instance yet, follow the steps to [create an instance](/Openstack-Information/setup-an-instance.md)!
1. Open the `Instances` section under the "Project" Header to list all active instances for your project. 
2. Next to the project, there should be a button "Create Snapshot" with a drop down option
3. In the drop down secion, select "Associate Floating IP"
4. In the resulting menu, there is a drop down under the header "IP Address"
    * To use an already-reserved Floating IP address, select the drop down and choose the IP that you want to associate with your instance
    * If you do not see an address in that drop down menu, or you prefer to make a new reservation, you can do so by selecting the "+" button to the right of the dropdown menu
        * Associate a description for your floating IP address to help you remember what you created it for. 
        * Select `Allocate IP`
    *If you have multiple network ports associated with this instance, select the port that you want to target in the second drop down under the "Port to be associated" header. 
5. Click `associate`!

Done! Your instance should now be accessible through the Floating IP address that you've associated with it. 

?>Not Connecting? Make sure your Security Group Permissions allow for this! More information available in the ["Security Groups" section of "Learn Neutron Networking"](/Openstack-Information/understanding-networking.md?id=security-groups)

## Add a floating IP from the "Floating IP" menu {docsify-ignore}
It is also possible to create an allocate floating IP addresses from the "Floating IPs" menu in the network configuration of your project. This way is fine as well, but for the purposes of simplicity, this document will focus on the options within the instances menu only.
