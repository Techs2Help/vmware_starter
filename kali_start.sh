#!/bin/bash
VM_IP=192.168.50.15

GREEN='\033[0;32m'
RED='\033[0;31m'

/usr/bin/vmrun -T ws start "/home/nic/Documents/virtual_machines/KaliLinux_BaseImage/KaliLinux_BaseImage.vmx" nogui

((count=15))
while [[ $count -ne 0 ]]; do
	ping -c 1 $VM_IP 2>/dev/null
	rc=$?
	if [[ $rc -eq 0 ]]; then
		((count = 1))
	else
		/usr/bin/sleep 1
	fi
	((count = count -1))
done

if [[ $rc -eq 0 ]]; then
	/usr/bin/echo -e "\n${GREEN}HOST is UP"
else
	/usr/bin/echo -e "\n${RED}HOST is UP"
fi
