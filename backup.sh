#!/bin/sh
numkeep=48
numexist=`ls /mnt/minecraft/bak|wc -l`

cp -r /mnt/minecraft/world /mnt/minecraft/bak/world$(date +%Y_%m_%d__%H_%M)
sleep 1
i=$(ls -1tr /mnt/minecraft/bak | head -n 1 )

if [ $numexist -gt $numkeep ]
then
	#do if number of backups exceeds threshold
	rm -rf /mnt/minecraft/bak/$i

else
	#do if number of backups that exists is behlow threshold
	sleep 1
fi
