# Kubernetes Integration Test Example

This directory contains an example for using Ansible together with 
Kubernetes to run an integration test.

## Getting Started

Install the necessary Python modules for Ansible. Assuming Python 3:

```sudo pip3 install openshift```

## Files

* `playbook.yaml`: Uses the Ansible k8s_raw module to deploy an application
  to Kubernetes (using a test namespace), run tests against it, and clean up.
* `group_vars/all.yaml`: YAML configuration for Ansible.

