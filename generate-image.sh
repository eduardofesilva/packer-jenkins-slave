#!/bin/bash
export PLAYBOOK="jenkins-slave.yml"
declare -a StringArray=("ansible" "ansible-galaxy" "packer" )
for binary in ${StringArray[@]}; do
   echo ---------Checking $binary installation----------
   which $binary >> /dev/null
   if [ $? -eq 0 ]; then
    echo $binary is installed
   else
    echo $binary is not installed
    exit 1
   fi
done
ansible-galaxy install -r requirements.yml
packer build jenkins-slave.json