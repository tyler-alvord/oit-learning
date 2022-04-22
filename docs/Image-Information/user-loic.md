# (Responsibly) Using Low Orbit Ion Cannon (LOIC)

!> Low Orbit Ion Cannon is ***NOT*** a toy. This tool must be handled with care to avoid incidents. If you are unsure if your test is within the reasonable use of this system, consult an administrator for input. To reiterate, you **must read the [OIT Student Rules of Engagement](/Openstack-Information/rules-of-engagement.md)** to understand the appropriate use of the tools contained within this image. Targeting any machine without expressed consent from the owner of that machine is a violation of Federal Law.

## What is the LOIC Image
Low Orbit Ion Cannon or LOIC is a Denial of Service utility notably used by Anonymous in a cyber attack - its source code was released to public domain. It will flood a targetted machine with web requests over TCP, UDP, or HTTP. You can customize the target, the protocol, the speed of the requests, the timeout for the requests, and the message that you are sending in the requests. Because it is a brute-force communication service, **it is highly traceable back to its origin** and should be easy to guard against or mitigate.

## How to use the LOIC Image
After starting the LOIC image, you will be asked to acknowledge the Rules of Engagement once more before moving forward and opening the LOIC utility. The LOIC app will open automatically after you accept the terms of the Rules of Engagement. 

This can be used for stress testing web server configurations, as well as configuring mitigation with a firewall, IPS, or host configuration. In order for such a small host to make an impact on the target, it's generally recommended to put your web service or application on a similarly small machine (so that the resources can be saturated properly).

### Using LOIC
1. After the application opens up, enter the address of your machine that you want to load test, click `lock on target`
2. Configure the payload of the utility
3. Click the `CHARGING MY LASER` button to begin the attack
4. When you are done, click the `Stop Flooding` button to stop the attack

## Standards
### OS Login 
|               |          |
|---------------|----------|
| **Username:** | oit      |
| **Password:** | owl@dm!n |  

## Additional Resources

