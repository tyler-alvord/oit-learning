# Using Infection Monkey (IMON)

---
## What is the Infection Monkey Image
Infection Monkey is a breach and attack simlutor. You can use it to target computers in your network, see how far a credential can go through your network (validate scoping and permissions). It will find vulnerable services, map how it was able to access computers that it was able to gain access to - even validate whether your network is zero-trust ready. When it's all done, it will provide results in a visual format withy insight into how to fix and mitigate the risks of the environment. 

This would be useful for validating your own configurations and applications that you're developing, or just to test what an attack looks like with a known-insecure configuration. This image will attempt to "infect" hosts with an inert reporting component (a "monkey") that attempts to spread itself from the image host throughout the network that you point it to. 

!>***DO NOT TARGET COMPONENTS THAT YOU DO NOT HAVE EXPLICIT PERMISSION TO ATTACK OR OTHERWISE INTERFERE WITH. THE COMPONENT IS DESIGNED TO BE HARMLESS, BUT IT IS A VIOLATION OF TRUST AND ETHICAL POLICY TO TARGET UNWILLING PARTICIPANTS***

---
## How to use the Infection Monkey Image
>Steps in this section are, in part, adapted from [the official Infection Monkey "Getting Started Guide" and User manual](https://www.guardicore.com/infectionmonkey/docs/usage/getting-started/)

Infection Monkey calls its host server "Monkey Island" - if you see this name come up, it's referencing the instance that is hosting the infection monkey server. 

1. Head over to https://localhost:5000 in the image instance's Firefox browser
2. Select "Run on the Monkey Island Server" - this will simulate the attack from the instance. 
    * If you have a designated starting point that you would like to use instead of the image instance, you can select the "machine of your choice" 
?>Ensure that this is either on a completely isolated network segment OR that you effectively set the scope for your test! The Monkey *will* try to access any hosts that it cn get its hands on. 
3. Head to the "configuration" tab. Here, you can configure extra components of the Monkey before letting it loose on the network segment that you're on. Some of the following configurations might be of interest to you:
    * Feed it passwords - this simluates stolen data or insider information that has been acquired to see how far these credentials can take the Monkey on the network
    * Run an [ATT&CK](https://attack.mitre.org/resources/getting-started/) test on a list of designated hosts - this runs through a matrix of actions to Execute, Evade detection, Discover the network, propagate through the network, exploit, and exfiltrate in a network. This simulates a cyber attack using known-methods of exploitation to show you how your network could be hit with a compromise.
    * Attempt to exploit known protocol vulnerabilities to see what they can gain access to on systems (SMB, SQL, Shell Shock, etc)
    * Network Segmentation testing  - validate that your network segments are actually as segmented as you think they are. 



---
## Standards
### OS Login 
|               |          |
|---------------|----------|
| **Username:** | oit      |
| **Password:** | owl@dm!n |  
### INFECTION MONKEY LOGIN
|               |          |
|---------------|----------|
| **Username:** | admin    |
| **Password:** | owl@dm!n |  

## Additional Resources
[Infection Monkey Documentation](https://www.guardicore.com/infectionmonkey/docs/)

[Mitre's ATT&CK Framework - Explained](https://youtu.be/Yxv1suJYMI8)