#!/bin/sh


if [ $# -ne 3 ]
then
	echo "[user ssh] [pass ssh] [host]"
	exit 1;
fi

user_ssh=$1
pass_ssh=$2
ip_host=$3

ssh-keyscan  $ip_host >> ~/.ssh/known_hosts
echo "Añadido a known_hosts"
bool=0
while [ $bool=0 ]
do
	sshpass -p $pass_ssh ssh $user_ssh@$ip_host eject
	sleep 1
	echo "Disquetera abierta"
done
exit 0
