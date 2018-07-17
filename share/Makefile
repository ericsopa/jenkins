fw:
	sudo scripts/iptables.sh

rpm:
	sudo scripts/puppet-rpm.sh

hosts-agent:
	sudo scripts/hosts-agent.sh

hosts-master:
	sudo scripts/hosts-master.sh

agent:
	sudo scripts/install-puppet-agent.sh

master:
	sudo scripts/install-puppet-master.sh

conf-agent:
	sudo cp share/agent/puppet.conf /etc/puppet/puppet.conf

conf-master:
	sudo cp share/master/puppet.conf /etc/puppet/puppet.conf

all:	fw rpm 

agent-all: all hosts-agent agent conf-agent

master-all: all hosts-master master conf-master

clean:
	ls
