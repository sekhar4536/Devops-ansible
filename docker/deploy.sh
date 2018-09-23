#!/bin/bash

STATE=present

if [ "$1" == "stop" ]
then
  STATE=absent
fi

ansible-playbook -i localhost, -e "desired_state=${STATE}" playbook-deploy.yaml 
