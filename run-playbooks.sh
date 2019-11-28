#!/bin/bash

# NGINX
ansible-playbook \
    -i "$(terraform output front_fqdn)," \
    -u jenkins \
    --ssh-common-args="-o StrictHostKeyChecking=no" playbooks/nginx.yml

# JAVA JENKINS
ansible-playbook \
    -i "$(terraform output manage_fqdn)," \
    -u jenkins \
    --ssh-common-args="-o StrictHostKeyChecking=no" playbooks/java-jenkins.yml
