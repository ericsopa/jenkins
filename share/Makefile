## master ##
master-all: all hosts-master install-master conf-master

## included in master-all
all:	fw rpm 

fw:
	sudo scripts/iptables.sh

rpm:
	sudo scripts/puppet-rpm.sh

hosts-master:
	sudo scripts/hosts-master.sh

install-master:
	sudo scripts/install-puppet-server.sh

conf-master:
	sudo cp master/puppet.conf /etc/puppet/puppet.conf
	sudo service puppetmaster start

## agent ##
agent-all: all hosts-agent install-agent conf-agent

hosts-agent:
	sudo scripts/hosts-agent.sh

install-agent:
	sudo scripts/install-puppet-agent.sh

conf-agent:
	sudo cp agent/puppet.conf /etc/puppet/puppet.conf
	sudo service puppet start

## master ##
gen-certs:
	sudo scripts/gen-certs.sh

## agent ##
gen-csr:
	sudo scripts/gen-csr.sh

## master ##
master-cert-sign:
	sudo scripts/master-cert-sign.sh

## agent ##
agent-fingerprint:
	sudo scripts/agent-fingerprint.sh

## master ##
java-module:
	sudo puppet module install -v 1.6.0 puppetlabs-java

jenkins-module:
	sudo puppet module install -v 1.2.0 rtyler-jenkins

manifests:
	sudo cp /home/vagrant/jenkins/share/master/manifests/site.pp /etc/puppet/manifests/
	sudo cp /home/vagrant/jenkins/share/master/manifests/init.pp /etc/puppet/manifests/
	sudo cp /home/vagrant/jenkins/share/master/modules/jenkins/init.pp /etc/puppet/modules/jenkins/manifests

clean:
	echo "I'm good"
