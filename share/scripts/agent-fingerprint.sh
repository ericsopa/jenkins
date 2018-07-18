#!/bn/bash
sudo puppet resource service pupper ensure=running
wait
sudo service puppet status
wait
sudo puppet agent--fingerprint
wait
sudo pupet agent -t

