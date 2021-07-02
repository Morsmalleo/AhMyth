#/bin/sh

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

cp /etc/apt/sources.list /etc/apt/sources.list.backup # backup
# Second backup created in case user stops the script after this point , then on next startup this script will
# copy the already changed sources file before as backup, in case user lost his original sources lists
file="/etc/apt/sources.list.stretch"
 [ ! -f "$file" ]
cp /etc/apt/sources.list /etc/apt/sources.list.stretch
rm -f /etc/apt/sources.list
touch /etc/apt/sources.list
bash -c 'echo "deb http://deb.debian.org/debian stretch main contrib non-free" > /etc/apt/sources.list'
xterm -T " Updating Repositories Debian Stretch " -geometry 100x30 -e "apt-get clean && apt-get clean cache && apt-get update -y"
sleep 2

apt-get install -y openjdk-8-jdk* openjdk-8-jre*

xterm -T " Reactivating Your Original Repositories " -geometry 100x30 -e "rm -f /etc/apt/sources.list && cp /etc/apt/sources.list.backup /etc/apt/sources.list"
#now we can remove the emergency backup securely
xterm -T " Removing emergency backup securly " -geometry 100x30 -e "rm -f /etc/apt/sources.list.stretch && rm -f /etc/apt/sources.list.backup"
apt-get clean
xterm -T " Updating Your Original Repositories " -geometry 100x30 -e "apt-get update"
clear
sleep 2

echo " |-------------------| "
echo " | Installing AhMyth | "
echo " |-------------------| " 
npm install && npm audit fix
clear
/usr/bin/update-alternatives --config java
sleep 2
clear
echo " |---------------------------| "
echo " | AhMyth has Been installed | "
echo " |---------------------------| "
sleep 2
clear
exit 0 
fi
