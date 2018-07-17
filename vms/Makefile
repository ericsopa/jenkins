keys:
	cp ~/.ssh/id_rsa_puppet.pub .
	cp ~/.ssh/id_rsa_puppet .
	vagrant scp id_rsa_puppet.pub master:/home/vagrant/.ssh/id_rsa_puppet.pub
	vagrant scp id_rsa_puppet master:/home/vagrant/.ssh/id_rsa_puppet
	vagrant scp id_rsa_puppet.pub agent:/home/vagrant/.ssh/id_rsa_puppet.pub
	vagrant scp id_rsa_puppet agent:/home/vagrant/.ssh/id_rsa_puppet
	rm -f id_rsa_puppet.pub
	rm -f id_rsa_puppet

ssh-add:
	vagrant ssh -c "chmod 0400 /home/vagrant/.ssh/id_rsa_puppet" agent
	vagrant scp .bash_profile agent:/home/vagrant/.bash_profile

agent-git:
	vagrant ssh -c "sudo yum -y install git-core" agent
	vagrant ssh -c "git clone git@github.com:ericsopa/jenkins.git" agent

master-git:
	vagrant ssh -c "sudo yum -y install git-core" master
	vagrant ssh -c "git clone git@github.com:ericsopa/jenkins.git" master

git:	agent-git master-git

vim:
	vagrant ssh -c 'echo \"colorscheme delek\" > ~/.vimrc' agent

all: keys ssh-add git vim 
