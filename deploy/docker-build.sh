#!/bin/bash
[[ -n "${BASE}" ]] || BASE=node:10
[[ -n "${TAG}" ]] || TAG=latest
[[ -n "${IMAGE}" ]] || IMAGE=alanhohn/todo
[[ -n "${WORKDIR}" ]] || WORKDIR=/app
[[ -n "${CMD}" ]] || CMD='["npm", "start"]'

check() {
  if [ "${1}" != "0" ]
  then
    echo "Failed $2"
    exit 1
  fi
}

echo "Starting a Docker container to build using Ansible"
DC=$(docker run --rm -d ${BASE} /bin/sleep 3600)
check $? "running Docker"
DC=${DC:0:12}

echo "Installing dependencies in the container"
docker exec ${DC} apt-get update
docker exec ${DC} apt-get install -y rsync

echo "Running Ansible for Docker build"
ansible-playbook -i ${DC}, playbook-docker-build.yaml
check $? "running Ansible"

echo "Committing result to an image"
docker commit --change="WORKDIR ${WORKDIR}" --change="CMD ${CMD}" ${DC} ${IMAGE}:${TAG}
check $? "committing result"

echo "Shutting down container"
docker rm -f ${DC}
