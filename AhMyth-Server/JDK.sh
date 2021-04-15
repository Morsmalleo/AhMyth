#/bin/sh

# Ensure we are being ran as root
if [ $(id -u) -ne 0 ]; then
	echo "This script must be ran as root"
	exit 1
fi

echo " |-------------------------| "
echo " | Installing npm & nodejs | "
echo " |-------------------------| "

apt-get install npm nodejs
sleep 1

echo " |------------------------------------------| "
echo " | Installing openJDK-8-JDK & openJDK-8-JRE | "
echo " |------------------------------------------| "
sleep 3

cp /etc/apt/sources.list /etc/apt/sources.list.backup # backup
# Second backup created in case user stops the script after this point , then on next startup this script will
# copy the already changed sources file before as backup, and user lost his original sources lists
file="/etc/apt/sources.list.stretch"
 [ ! -f "$file" ]
cp /etc/apt/sources.list /etc/apt/sources.list.stretch
rm -f /etc/apt/sources.list
touch /etc/apt/sources.list
echo "deb http://deb.debian.org/debian stretch main contrib non-free" > /etc/apt/sources.list
xterm -T " Updating Repositories Debian Stretch " -geometry 100x30 -e "sudo apt-get clean && sudo apt-get clean cache && sudo apt-get update -y"
sleep 1

apt-get install openjdk-8-jdk -y
apt-get install openjdk-8-jre -y

xterm -T " Reactivating your original repositories " -geometry 100x30 -e "rm -f /etc/apt/sources.list && cp /etc/apt/sources.list.backup /etc/apt/sources.list"
#now we can remove the emergency backup securely
xterm -T " Removing emergency backup securly " -geometry 100x30 -e "rm -f /etc/apt/sources.list.stretch && rm -f /etc/apt/sources.list.backup"
apt-get clean
xterm -T " Updating Your Repo " -geometry 100x30 -e "apt-get update"
sleep 1

echo " |------------------------------| "
echo " | openJDK 8 has Been installed | "
echo " |------------------------------| "
sleep 1
exit 0
fi
