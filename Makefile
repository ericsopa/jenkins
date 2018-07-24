export VAGRANT_CWD := vms

ithappen:
	@echo "Standing up a 2 VM Puppet Master-Agent env"
	vagrant init	
	mv Vagrantfile vms/	
	vagrant up
	@echo "Prep VMs with certs, Git and repo"
	make -C vms all
	@echo "Prep Puppet Master VM: fw, rpm, hosts file, Puppet Server, puppet.conf"
	vagrant ssh -c "make -C jenkins/share master-all" master
	@echo "Prep Puppet Agent VM: fw, rpm, hosts file, Puppet Agent, puppet.conf"
	vagrant ssh -c "make -C jenkins/share agent-all" agent
	@echo "Generating certs on Master"
	vagrant ssh -c "make -C jenkins/share gen-certs" master
	@echo "Generating cert signing request on Agent"
	vagrant ssh -c "make -C jenkins/share gen-csr &" agent &
	@echo "Sign certs on Master"
	vagrant ssh -c "make -C jenkins/share master-cert-sign" master
	@echo "Verify Agent fingerprint"
	vagrant ssh -c "make -C jenkins/share agent-fingerprint" agent
	@echo "Install Java and Jenkins modules on Master"
	vagrant ssh -c "make -C jenkins/share java-module jenkins-module" master
	@echo "Install custom manifests on Master"
	vagrant ssh -c "make -C jenkins/share manifests" master
	@echo "Puppet installs Java and Jenkins on Agent"
	vagrant ssh -c "sudo puppet agent -t " agent
	@echo "Jenkins should be running on http://10.0.0.10:8000"
