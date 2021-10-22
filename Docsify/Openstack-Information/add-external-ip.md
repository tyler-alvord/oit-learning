# Add an external IP address
Openstack doesn't allow you to add an external IP addres directly to the host (as in, assigning an IP from the network to a Network Interface Card on the guest). Instead, you can leverage 1:1 Network Address Translation to provide external access to the Guests within Openstack. This feature is called "Floating IP"

1.  Head to the "Network" tab within the "Project" menu
2.  Select the "Floating IPs" option from the resulting drop down
3.  Next to the Allocated floating IP, select "Associate"
4.  Select the instance that you want to give the IP