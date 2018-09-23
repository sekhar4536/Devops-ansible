# Hands-On DevOps with Ansible

This code repository contains examples from the video course Hands-On
DevOps with Ansible by Alan Hohn, published by Packt Publishing.

## Prerequisites

These prerequisites are needed to get the primary example working,
including deploying the infrastructure to build the containerized
version of the application.

1. Install Ansible. This can be done using `pip`.
1. Install required roles:

   * `ansible-galaxy install geerlingguy.gitlab`
   * `ansible-galaxy install riemers.gitlab-runner`
   * `ansible-galaxy install geerlingguy.nodejs`
   * `ansible-galaxy install geerlingguy.docker`
   * `ansible-galaxy install andrewrothstein.kubectl`

1. Update `infrastructure/group_vars/gitlab-runner/vault.yaml` with your own content
   (and then encrypt with Ansible Vault). Alternatively you can modify the
   `gitlab-runner-config` role to point to your own preferred or private Docker
   registry.
1. Update the `infrastructure/inventory` file as appropriate for your
   environment, or configure your SSH config, DNS, or hosts file to match the
   servers in the inventory.
1. Update the `playbook.yaml` and `app.yaml` files in `todo/deployment`
   to reflect the correct name for your Docker image based on your DockerHub
   login or preferred registry.

*Sample* content for `infrastructure/group_vars/gitlab-runner/vault.yaml`:

```yaml
---
docker_user: "docker"
docker_password: "rekcod"
docker_email: "docker@docker.io"
```

## Guide to Contents

This repository contains the following content. Also see the `README.md`
file in each subdirectory for more information.

* `deploy`: Contains samples for testing with and deploying to Amazon Web
  Services (AWS). 
* `infrastructure`: Contains Ansible playbooks to set up a DevOps
  infrastructure (Gitlab and Jenkins). This can be set up on physical, virtual,
  or cloud machines. 
* `kubernetes`: Contains an Ansible playbook that demonstrates running an
  integration test in Kubernetes.
* `todo`: Contains a "Todo" Javascript application. Within that directory is
  a `Dockerfile` for building a Docker container and a `deployment` directory
  for deploying the built image to Kubernetes.

