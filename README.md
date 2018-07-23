# jenkins 
### Dependencies
1. VirtualBox
1. Vagrant
1. Vagrant scp plugin
1. SSH private key for github.com repo

### Project Files
1. SSH key
  * Id_rsa_puppet
2. Repo
  * https://github.com/ericsopa/jenkins
3. Documentation

### Test Environment Setup
Assumes linux or Windows with Cygwin or other GNU tools like SSH. This project was built on Windows 10 with Cygwin.
1. Install VirtualBox
2. Install Vagrant
3. Install vagrant scp plugin
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
ssh-agent /bin/sh
ssh-add ~/.ssh/id_rsa_puppet
```
6. Clone Git repo 
```
git clone git@github.com:ericsopa/jenkins.git
```

### Installation
 * host = Computer running Virtualbox
 * vagrant = user to login to VMs
 * master = VM with Puppet Server
 * agent = VM with Puppet Agent

The shortest path to done is:
```
[host:/~/src/jenkins] $ make ithappen
```
If that fails for some reason, you can do the steps one at a time:

```
[host:/~/src/jenkins/vms] $ vagrant up
[host:/~/src/jenkins/vms] $ make all
[host:/~/src/jenkins/vms] $ vagrant ssh master
                --- switch host ---
         [vagrant@master] $ cd jenkins/share
         [vagrant@master] $ make master-all
                --- switch host ---
[host:/~/src/jenkins/vms] $ vagrant ssh agent
                --- switch host ---
          [vagrant@agent] $ cd jenkins/share
          [vagrant@agent] $ make agent-all
                --- switch host ---
         [vagrant@master] $ make gen-certs
                --- switch host ---
          [vagrant@agent] $ make gen-csr
                --- switch host ---
         [vagrant@master] $ make master-cert-sign
                --- switch host ---
          [vagrant@agent] $ make agent-fingerprint
                --- switch host ---
         [vagrant@master] $ make java-module
         [vagrant@master] $ make jenkins-module
         [vagrant@master] $ make manifest
                --- switch host ---
          [vagrant@agent] $ sudo puppet agent -t
```
### Test
On host, open a web browser and connection to:

 * http://10.0.0.10:8000

Jenkins should be listening on port 8000.
