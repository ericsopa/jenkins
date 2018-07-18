fw:
	sudo scripts/iptables.sh

rpm:
	sudo scripts/puppet-rpm.sh

hosts-agent:
	sudo scripts/hosts-agent.sh

hosts-master:
	sudo scripts/hosts-master.sh

install-agent:
	sudo scripts/install-puppet-agent.sh

install-master:
	sudo scripts/install-puppet-master.sh

conf-agent:
	sudo cp agent/puppet.conf /etc/puppet/puppet.conf

conf-master:
	sudo cp master/puppet.conf /etc/puppet/puppet.conf

sitemanifest:
	sudo cp /home/vagrant/jenkins/share/master/site.pp /etc/puppet/manifests/

gen-certs:
	sudo scripts/gen-certs.sh

gen-csr:
	sudo scripts/gen-csr.sh

java-module:
	sudo puppet module install -v 1.6.0 puppetlabs-java

tomcat-module:
	sudo puppet module install -v 1.5.0 puppetlabs-tomcat

all:	fw rpm 

master-all: all hosts-master install-master conf-master gen-certs

agent-all: all hosts-agent install-agent conf-agent gen-csr

master-cert-sign:
	sudo scripts/master-cert-sign.sh

agent-fingerprint:
	sudo scripts/agent-fingerprint.sh

clean:
	ls
