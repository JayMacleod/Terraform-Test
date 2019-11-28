#!/bin/bash

# NGINX
ansible-playbook \
    -i "$(terraform output front_fqdn), $(terraform output manage_fqdn)," \
    -u jenkins \
    --ssh-common-args="-o StrictHostKeyChecking=no" playbooks/nginx.yml
