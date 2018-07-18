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

gen-certs:
	sudo cp scripts/gen-certs.sh

gen-csr:
	sudo cp scripts/gen-csr.sh

master-cert-sign:
	sudo puppet cert list
	sudo puppet cert sign agent.attlocal.net

agent-fingerprint:
	sudo puppet resource service pupper ensure=running
	sudo service puppet status
	sudo puppet agent--fingerprint
	sudo pupet agent -t

java-module:
	sudo puppet module install puppetlabs-java

tomcat-module:
	sudo puppet module install puppetlabs-tomcat

all:	fw rpm 

agent-all: all hosts-agent install-agent conf-agent gen-csr

master-all: all hosts-master install-master conf-master gen-certs

clean:
	ls
