# jenkins 
### Dependencies
1. CentOS 6/Puppet 3.8.7 Master VM
1. CentOS 6/Puppet 3.8.7 Agent VM
1. /etc/hosts file entries similar to share/master/hosts-master.tmp on Master
1. /etc/hosts file entries similar to share/agent/hosts-agent.tmp on Agent
1. /etc/puppet/puppet.conf similar to shre/master/puppet.conf on Master
1. /etc/puppet/puppet.conf similar to shre/agent/puppet.conf on Agent
1. Master-Agent signed certs in place, environment ready for Puppet code
1. "jenkins" repo in ~ on Master and Agent VMs
1. ~  = /home/vagrant/

### Project Files
1. Repo uploaded, also available at:
  * https://github.com/ericsopa/jenkins
2. Documentation

### Installation
 * master = VM with Puppet Server
 * agent = VM with Puppet Agent

```
    [vagrant@master:~/jenkins/share] $ make puppet
           --- switch host ---
    [vagrant@agent:~/jenkins/share] $ make deploy
```
### Test
On host, open a web browser and connection to:

 * http://10.0.0.10:8000

Jenkins should be listening on port 8000.
