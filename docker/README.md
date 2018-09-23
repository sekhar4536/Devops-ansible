# Docker Examples

This directory contains examples for using Ansible together with Docker
(without deploying to Kubernetes).

## Getting Started

Install the necessary Python modules for Ansible. Assuming Python 3:

```sudo pip3 install docker-compose```

## Files

Playbooks in this directory:

* `playbook-container.yaml`: Use Docker from Ansible, creating a volume, network,
  and containers to run the application.
* `playbook-stop-container.yaml`: Shut down the Docker application.
* `playbook-deploy.yaml`: Deploy the same application but using `docker_service`
  with a Docker Compose service file. Supports rolling updates. Also used for
  teardown; see `deploy.sh` and the video course for details.

