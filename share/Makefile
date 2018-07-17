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

all:	fw rpm 

agent-all: all hosts-agent agent

master-all: all hosts-master master

clean:
	ls
