#!/bin/sh

# TODO: Create EC2 machines and fill the inventory file.

ansible-playbook -i machines.ec2 -u ec2-user remote-infrastructure.yml
