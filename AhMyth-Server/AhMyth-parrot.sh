#/bin/sh

# Ensure we are being ran as root
if [ $(id -u) -ne 0 ]; then
	echo "This script must be ran as root"
	exit 1
fi

clear
echo " |-------------------------| "
echo " | Installing Prerequisits | "
echo " |-------------------------| "
sleep 2

apt-get install xterm -y # Needed for the automatic software repo swap and backup
apt-get install npm nodejs -y
clear
sleep 1

echo " |----------------------| "
echo " | Installing openJDK 8 | "
echo " |----------------------| "
sleep 2

mv /etc/apt/sources.list.d/parrot.list /home
file="/etc/apt/sources.list.stretch"
if [ ! -f "$file" ]
then
touch /etc/apt/sources.list.stretch
echo "deb http://deb.debian.org/debian stretch main contrib non-free" > /etc/apt/sources.list.stretch
xterm -T " Updating Repositories Debian Stretch " -geometry 100x30 -e "apt-get clean && apt-get clean cache && apt-get update -y"
sleep 2

apt-get install -y openjdk-8-jdk* openjdk-8-jre*

xterm -T " Reactivating Your Original Repositories List" -geometry 100x30 -e "rm -f /etc/apt/sources.list.stretch && mv /home/parrot.list /etc/apt/sources.list.d"
apt-get clean
xterm -T " Updating Your Original Repositories " -geometry 100x30 -e "apt-get update"
clear
sleep 2

echo " |-------------------| "
echo " | Installing AhMyth | "
echo " |-------------------| " 
su -c "npm install && npm audit fix" user
clear
echo " Please switch to Java 8 for AhMyth to work properly "
/usr/bin/update-alternatives --config java 
echo " |---------------------------| "
echo " | AhMyth has Been installed | "
echo " |---------------------------| "
sleep 2
clear
exit 0 
fi
