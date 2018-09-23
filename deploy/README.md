# DevOps with Ansible VM Deployment

This directory contains configuration files to deploy the "todo" application
using virtual machines (using Amazon Web Services and VirtualBox via Vagrant).

## Amazon Web Services (AWS)

To deploy to Amazon Web Services, we first build an Amazon Machine Image
(AMI) using Packer. We then create an AWS Launch Configuration,
Auto Scaling Group, and Elastic Load Balancer using Ansible.

The `build.sh` script kicks off the process.

### Required Customization

1. Set up the standard `$HOME/.aws/config` and `$HOME/.aws/credentials`
   files.
1. Create / identify AWS security groups that allow you to connect to
   port 22 from your own IP and that allow open connectivity with a private
   subnet (172.31.0.0/20 is the default). Also identify the AWS subnet ID you
   want for your VMs.   
1. Edit the `group_vars/all.yaml` file with your AWS information (at least
   the security group(s) and subnet, but you can change other items too).
1. Edit the `packer-aws.json` file with your AWS information.

### Prerequisites

1. Make sure your local Python has Ansible, Boto, and Boto3 installed
   (e.g. using `pip` or `pip3`).
1. Provision a VM in AWS that we'll use for our database:
   `ansible-playbook -i localhost, playbook-provision-db.yaml`
1. Edit the `inventory` entry for `database01` to match your AWS VM.
1. Provision PostgreSQL:
   `ansible-playbook -i inventory playbook.yaml`

If you have issues provisioning the database, SSH into the AWS VM and
run `sudo apt-get update`.

### Build and Deploy

Run `build.sh` to run Packer and deploy to AWS.

### Teardown

To tear down the Auto Scaling Group and Elastic Load Balancer, you can run:
`ansible-playbook -i localhost, playbook-teardown.yaml`. You'll have to
delete the database VM separately.

## Vagrant

The Vagrant configuration is all-in-one. Make sure you have Vagrant,
VirtualBox, and Ansible installed, then run `vagrant up`.

The `Vagrantfile` also includes configuration for using Vagrant with Amazon
Web Services. Setting up the necessary Vagrant plugin is described in the course.

