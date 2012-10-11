#!/bin/bash
# vagrantrollback.sh: will run vagrant up against all agents listed

if [ -z "$1" ]
then
  echo "Usage: `basename $0` [vagrant-agent1] [vagrant-agent2]"
  exit $E_NOARGS
fi

if [ ! -e Vagrantfile ]
then
  echo "Have to run in the a Vagrant folder"
  exit $E_NOARGS
fi

until [ -z "$1" ]
do
  #echo "vagrant up ${1}"
  vagrant sandbox rollback ${1}
  shift
done
