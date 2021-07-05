#!/bin/bash

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

cp /etc/apt/sources.list /etc/apt/sources.list.backup # backup
# Second backup created in case user stops the script after this point , then on next startup this script will
# copy the already changed sources file before as backup, in case user lost his original sources lists
file="/etc/apt/sources.list.stretch"
 [ ! -f "$file" ]
cp /etc/apt/sources.list /etc/apt/sources.list.stretch
rm -f /etc/apt/sources.list
touch /etc/apt/sources.list
echo "deb http://deb.debian.org/debian stretch main contrib non-free" > /etc/apt/sources.list
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
su -c "npm install && npm audit fix" kali
clear
/usr/bin/update-alternatives --config java
clear
echo " |---------------------------| "
echo " | AhMyth has Been installed | "
echo " |---------------------------| "
sleep 2

clear
echo "|----------|"
echo "| OPTIONAL |"
echo "|----------|"

echo "Do you want to create a shortcut for AhMyth in your system"
echo "so you can run AhMyth from anywhere in your terminal and desktop?"
echo ""
echo "$cyan" "Choose y/n : "
read -r cho
case "$cho" in

y|Y|Yes|yes|YES)
lnk=$?
if [ "$lnk" ==  "0" ];then
dir=`pwd` 
scrp="cd $dir && npm start"
rm -f /usr/local/sbin/ahmyth
touch /usr/local/sbin/ahmyth
echo "#!/bin/bash" > /usr/local/sbin/ahmyth
echo "$scrp" >> /usr/local/sbin/ahmyth
cd .. && cp "Config/AhMyth.desktop" /usr/share/applications/AhMyth.desktop
cp "AhMyth-Server/build/icons/64x64.png" /usr/share/icons/64x64.png
chmod +x /usr/local/sbin/ahmyth
chmod +x ahmyth
which ahmyth >> "$log" 2>&1
clear
echo " |------------------------------------------------------------------------------------| "
echo " | Installation completed, To execute AhMyth, type 'ahmyth' anywhere in your terminal | "
echo " |------------------------------------------------------------------------------------| "
exit 0
fi
;;

n|no|No|NO)
clear
echo " |---------------------------------------------------------------------------------------------------| "
echo " | AhMyth Has been installed, you can launch it by running 'npm start' inside 'AhMyth/AhMyth-Server' | "
echo " |---------------------------------------------------------------------------------------------------| "
esac
exit 0
;; 
