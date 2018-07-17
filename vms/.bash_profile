# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/bin

export PATH

eval $(ssh-agent -s)
trap 'kill $SSH_AGENT_PID' EXIT
ssh-add /home/vagrant/.ssh/id_rsa_puppet
