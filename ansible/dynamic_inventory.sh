#!/bin/bash

# executable returns Ansible inventory.yml
# The source accept --list and --host <hostname> as arguments. --host will only be used if no _meta key is present. 
# be called per host otherwise.

rm inventory.yml 2>/dev/null;rm tmp.txt 2>/dev/null
gcloud --format="value(name,networkInterfaces[0].accessConfigs[0].natIP)" compute instances list >tmp.txt


if [[ $1 == "--list" ]]; then
awk -F " " '{print $1 " " $2}' tmp.txt | while read i; do 
a=( $i ); 
echo -e "${a[0]}:
  hosts:
    appserver:
         ansible_host: ${a[1]}" >> inventory.yml
done
fi




if [[ $1 == "--host" ]]; then

  awk -F " " '{print $1 " " $2}' tmp.txt | while read i; do 
  a=( $i );

    if [[ $2 == "dinky" ]]; then
      awk -F " " '{print $1 " " $2}' tmp.txt | while read i; do 
      a=( $i ); 
      echo -e "${a[0]}:
        hosts:
          appserver:
               ansible_host: ${a[1]}" > inventory.yml
    break

      done
    break
    fi

  done
fi


