keys:
	cp ~/.ssh/id_rsa_puppet .
	vagrant scp id_rsa_puppet master:/home/vagrant/.ssh/id_rsa_puppet
	vagrant scp id_rsa_puppet agent:/home/vagrant/.ssh/id_rsa_puppet
	rm -f id_rsa_puppet

ssh-add:
	vagrant ssh -c "chmod 0400 /home/vagrant/.ssh/id_rsa_puppet" agent
	vagrant scp .bash_profile agent:/home/vagrant/.bash_profile
	vagrant ssh -c "chmod 0400 /home/vagrant/.ssh/id_rsa_puppet" master
	vagrant scp .bash_profile master:/home/vagrant/.bash_profile
	vagrant scp known_hosts agent:/home/vagrant/.ssh
	vagrant scp known_hosts master:/home/vagrant/.ssh

agent-git:
	vagrant ssh -c "sudo yum -y install git-core" agent
	vagrant ssh -c "git clone git@github.com:ericsopa/jenkins.git" agent

master-git:
	vagrant ssh -c "sudo yum -y install git-core" master
	vagrant ssh -c "git clone git@github.com:ericsopa/jenkins.git" master

git:	agent-git master-git

vim:
	vagrant ssh -c 'echo \"colorscheme delek\" > ~/.vimrc' agent
	vagrant ssh -c 'echo \"colorscheme delek\" > ~/.vimrc' master

all:	keys ssh-add git vim 
