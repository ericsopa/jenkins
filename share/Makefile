fw:
	sudo scripts/iptables.sh

rpm:
	sudo scripts/puppet-rpm.sh

hosts:
	sudo scripts/hosts.sh

agent:
	sudo scripts/install-puppet-agent.sh

master:
	sudo scripts/install-puppet-master.sh

all:	fw rpm hosts 

agent-all: all agent

master-all: all master

clean:
	ls
