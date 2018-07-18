#!/bn/bash
sudo puppet resource service pupper ensure=running
sudo service puppet status
sudo puppet agent--fingerprint
sudo pupet agent -t

