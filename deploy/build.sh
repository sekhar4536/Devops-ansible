#!/usr/bin/env bash
rm -f manifest.json

packer build packer-aws.json

AMI=$(cat manifest.json | jq -r .builds[0].artifact_id |  cut -d':' -f2)

ansible-playbook -e ami=${AMI} -i localhost, playbook-deploy-todo.yaml
