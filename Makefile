export VAGRANT_CWD := vms

env:
	@echo "make_env: Standing up a 2 VM Puppet Master-Agent env"
	vagrant init	
	mv Vagrantfile vms/	
	vagrant up

cca:
	@echo "make_cca: Prep VMs with certs, Git and repo"
	make -C vms all
	@echo "make_cca: Prep Puppet Master VM: fw, rpm, hosts file, Puppet Server, puppet.conf"
	vagrant ssh -c "make -C jenkins/share master-all" master
	@echo "make_cca: Prep Puppet Agent VM: fw, rpm, hosts file, Puppet Agent, puppet.conf"
	vagrant ssh -c "make -C jenkins/share agent-all" agent
	@echo "make_cca: Generating certs on Master"
	vagrant ssh -c "make -C jenkins/share gen-certs" master
	@echo "make_cca: Generating cert signing request on Agent"
	vagrant ssh -c "make -C jenkins/share gen-csr &" agent
	@echo "make_cca: Sign certs on Master"
	vagrant ssh -c "make -C jenkins/share master-cert-sign" master
	@echo "make_cca: Verify Agent fingerprint"
	vagrant ssh -c "make -C jenkins/share agent-fingerprint" agent

jenkins:
	@echo "jenkins: Install Java and Jenkins modules and Puppet manifrests on Master"
	vagrant ssh -c "make -C jenkins/share puppet" master
	@echo "jenkins: Puppet installs Jenkins on Agent"
	vagrant ssh -c "make -C jenkins/share deploy" agent

ithappen: env cca jenkins

clean:
	vagrant destroy --force
	mv vms/Vagrantfile .
	rm -rf vms/.vagrant
