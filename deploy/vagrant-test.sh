#!/bin/bash
[[ -n "${PROVIDER}" ]] || PROVIDER=virtualbox

echo "Making sure test environment is clean"
vagrant destroy -f
rm -fr './~vagrant'

echo "Running test"
vagrant up --provider=${PROVIDER}
RET=$?

echo "Shutting down test environment"
vagrant destroy -f

exit $RET
