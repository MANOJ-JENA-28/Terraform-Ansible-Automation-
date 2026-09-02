#!/bin/bash 

## Deployment script for ansible playbook

cd terraform

terraform apply -auto-approve

EC2_IP=$(terraform output -raw ec2_public_ip)

cd ..

cd ansible

echo "[web]" > inventory.ini

echo "$EC2_IP ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/awskey-1.pem" >> inventory.ini

ansible-playbook -i inventory.ini playbook.yml
