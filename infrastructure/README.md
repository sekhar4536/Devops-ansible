# DevOps with Ansible Infrastructure

This directory provides Ansible playbooks for automatic installation
of DevOps infrastructure. Edit the `inventory` file to match your
configuration (or make sure that the listed hostnames are resolvable
in your environment and that you can use passwordless SSH and passwordless
`sudo` with them). Also make sure that Python is installed on the machines
that will be managed using this playbook.

For example, on Ubuntu or Debian, you can use:

```sh
sudo apt-get update && sudo apt install -y python3
```

Note that this uses Python 3, which matches the configuration in
`group_vars/all.yaml`. If you are still using Python 2 with your Ansible
installation (or with your controlled machines) you will need to make sure
Python 2 is installed and remove the `ansible_python_interpreter` variable
from `group_vars/all.yaml`.


