# Other Instance Management Options
You'll find a few other options in the Openstack Web UI that aren't explained in the core docuements. This article covers some of the details of some of the additional useful features available in the Horizon UI

?> Almost all of the additional actions that you can apply to a given machine should be available through the drop down menu to the right of the machine information in the `instances` section

## Basic System Management
### Soft Reboot {docsify-ignore}
This is the OS-level reboot command. It will gracefully shutdown the operating system services and reboot the machine

### Hard Reboot {docsify-ignore}
The equivalent of pulling the power and plugging a machine back in again

## Manage instance states and backups
### Create Snapshot {docsify-ignore}
Snapshots are point in time captures of a machines state. This will allow you to make changes to your system and save them in a way that is similar to Imaging. If you want to be able to spawn multiple machines with a common non-standard configuration, you can use a snapshot to do so. You can access snapshots that have been created for your instance in the `Images` section under the `Compute` Drop down in the `Project` header and launch instances from it like an image.

### Pause Instance {docsify-ignore}
A paused instance will store the machine in its exact state in volatile memory (RAM). This retains all of the resource usage, but the machine is still running in a "frozen" state and not in a traditional "on" state.

Think of this as putting the instance into a "warm" state, where actually running the instance is a "hot" state. 

**Avoid using "pause" for prolonged periods of time.**

### Suspend Instance {docsify-ignore}
Similar to the "paused" state, but instead is stored on the hard drive storage of the environment rather than the volatile memory. It will free up the resources of the instance. 

This option is somewhere between "warm" storage and "cold" storage - call it lukewarm, if you will. Good for instances you won't need to use for a while.

**Don't suspend instances for extended durations (many days)**

### Shelve Instance {docsify-ignore}
Turns the system off and loses all information in volatile storage (anything in system memory is removed before storing). Any component that is associated with the hardware will be stored in it's current state (this includes volumes and ephemeral storage). The instance's hold on quotas will remain present (it will still count as an instance in your three instances). This will usually take a snapshot of the instance.

This is cold storage for your instances. use it when you want to keep an image, but don't want to access it for the time being. 

### Rebuild Instance {docsify-ignore}
Create the instance with the same connected networks and storage blocks, but reset the actual booted environment to the settings that are stored in the image. This is like a hard reset of the instance to remove any and all configurations that you might have applied. 

### Rescue Instance {docsify-ignore}
Boot another instance and mount the hard drive of your instance

This is only for use for emergency recovery and should generally be avoided. 

## Some helpful links
[Openstack docs - how to start and stop instances](https://docs.openstack.org/mitaka/user-guide/cli_stop_and_start_an_instance.html)
