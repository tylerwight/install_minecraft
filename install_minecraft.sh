#!/bin/sh
#Install Vanilla Minecraft
#Tyler Wight
#Gamename variable will affect the name of the user and folder structure created
#=====================
gamename=minecraft
#=====================

cronjob="*/30 * * * * /mnt/${gamename}/backup.sh"
sudo adduser $gamename
sudo usermod -aG sudo $gamename
sudo apt-get update -y && sudo apt-get upgrade -y
sudo add-apt-repository ppa:linuxuprising/java
sudo apt update
sudo apt install oracle-java16-installer -y


sudo mkdir /mnt/$gamename
sudo mkdir /mnt/$gamename/bak

sudo cp -n ./backup.sh /mnt/$gamename/backup.sh


sudo chown -R $gamename:$gamename /mnt/$gamename

sudo su -c "wget https://launcher.mojang.com/v1/objects/0a269b5f2c5b93b1712d0f5dc43b6182b9ab254e/server.jar  -O /mnt/${gamename}/server.jar" -s /bin/sh $gamename
sudo su -c "echo 'java -Xms128M -Xmx5000M -jar /mnt/${gamename}/server.jar nogui' > /mnt/${gamename}/start.sh" -s /bin/sh $gamename

sudo chmod +x /mnt/${gamename}/start.sh

sudo su -c "(crontab -l| grep -v -F '$cronjob'; echo '$cronjob') | crontab -" -s /bin/sh $gamename



echo "${gamename} has been installed"
echo "During the insallation we created a user named ${gamename} and installed the game to location /mnt/${gamename}"
echo "You can run this script again without harm"
