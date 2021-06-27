#!/bin/bash
#
#script to install and configure ansible controller
#
#update and install dependencies
sudo apt update -y
sudo apt upgrade -y
sudo apt install -y ansible
#configure ssh keys and servers nodes list
cd .ssh/
#default user key
ssh-keygen -t rsa -b 4096 -C "user default"
ssh-keygen -t rsa -b 4096 -f /home/aviram/.ssh/ansible -C "Ansible" 
touch servers.txt
cat <<EOT >> servers.txt
server_node_1
server_node_2
server_node_3
EOT
#deploy public keys on nodes
#for f in `cat servers.txt`; do ssh $f `ssh-copy-id -i ~/.ssh/id_rsa.public` -a; done
cat servers.txt |  while read output
do
    ssh-copy-id -i ~/.ssh/ansible.pub "$output" > /dev/null
    if [ $? -eq 0 ]; then
    echo "node $output is deployed with ssh key" 
    else
    echo "node $output failed to deploy shh key"
    fi
done
