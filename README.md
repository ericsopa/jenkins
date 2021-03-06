# jenkins 

## Level 1 Automation
Code allows for a fully automated setup of a two VM environement using Vagrant and VirtualBox, installation of Puppet and Jenkins.

### Dependencies
1. VirtualBox
1. Vagrant
1. Vagrant scp plugin
1. GNU make, git-core, ssh
1. SSH private key for github.com repo

### Setup
Assumes linux or Windows with Cygwin or other GNU tools like SSH. This project was built on Windows 10 with Cygwin.

1. Install Git, make (Cygwin or XCode) 
2. Install VirtualBox
3. Install Vagrant
4. Install vagrant scp plugin
```
vagrant plugin install vagrant-scp
```
4. Copy SSH keys to ~/.ssh directory
```
cp id_rsa_puppet ~/.ssh
```
5. Configure SSH keys
```
chmod 0400 ~/.ssh/id_rsa_puppet*
ssh-agent /bin/bash
ssh-add ~/.ssh/id_rsa_puppet
```
6. Clone Git repo
```
git clone git@github.com:ericsopa/jenkins.git
```
### Installation
```
[host:/~/jenkins] $ make ithappen
```

This automation is broken down into 3 phases:
1. env (2 VMs via Vagrant, Virtual Box, Vagrant scp, private key)
1. cca (Puppet 3.8.7 Master and Agent)
1. jenkins (Jenkins installed via Puppet)


## Level 2 Automation
Code allows automated installation of Puppet 3.8.7 on two clean OS installs of CentOS 6 of your choosing.

### Dependencies
1. Two clean OS installs of CentOS 6
1. GNU make

### Setup
Copy "jenkins" repo in ~ on Master and Agent VMs

### Installation
On each machine, run the following commands:
```
[vagrant@master:~/jenkins/share] $ make master-all
       --- switch host ---
 [vagrant@agent:~/jenkins/share] $ make agent-all
       --- switch host ---
[vagrant@master:~/jenkins/share] $ make gen-certs
       --- switch host ---
 [vagrant@agent:~/jenkins/share] $ make gen-csr
       --- switch host ---
[vagrant@master:~/jenkins/share] $ make master-cert-sign
       --- switch host ---
 [vagrant@agent:~/jenkins/share] $ make agent-fingerprint
       --- switch host ---
[vagrant@master:~/jenkins/share] $ make puppet
       --- switch host ---
 [vagrant@agent:~/jenkins/share] $ make deploy
```

## Level 3 Automation
Code allows automated deployment of Jenkins on two Puppet 3.8.7 Master-Agent VMs of your choosing

### Dependencies
1. CentOS 6/Puppet 3.8.7 Master VM
1. CentOS 6/Puppet 3.8.7 Agent VM
1. /etc/hosts file entries on Master similar to jenkins/share/master/hosts-master.tmp
1. /etc/hosts file entries on Agent similar to jenkins/share/agent/hosts-agent.tmp
1. /etc/puppet/puppet.conf similar to jenkins/share/master/puppet.conf on Master
1. /etc/puppet/puppet.conf similar to jenkins/share/agent/puppet.conf on Agent
1. Master-Agent signed certs in place, Puppet environment ready for Puppet code

### Setup
Copy "jenkins" repo in ~ on Master and Agent VMs

### Installation
```
[vagrant@master:~/jenkins/share] $ make puppet
       --- switch host ---
 [vagrant@agent:~/jenkins/share] $ make deploy
```

### Test
On host, open a web browser and connection to:

 * http://10.0.0.11:8000

Jenkins should be listening on port 8000.

Run make deploy again, nothing is changed and Jenkins is still listening on port 8000.
```
[vagrant@agent:~/jenkins/share] $ make deploy
```
