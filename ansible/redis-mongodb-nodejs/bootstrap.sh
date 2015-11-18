#!/bin/sh

ansible-galaxy install -r external_roles.yml -p provisioning/roles/ --force
