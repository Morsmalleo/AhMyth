# AhMyth Android Rat

## Getting Started
### You can install this two ways
#### 1) Run the AhMyth installer shell script (`AhMyth.sh`) located inside `AhMyth/AhMyth-Server`
1. ```git clone https://github.com/Morsmalleo/AhMyth.git```
2. ```cd AhMyth/AhMyth-Server```
3. ```chmod +x AhMyth.sh```
4. ```sudo ./AhMyth.sh```
#### Use update-alternatives to select and use openJDK 8
5. ```update-alternatives --config java``` - Select the corresponding number for OpenJDK-8-JDK
#### Now you can run AhMyth
6. ```npm start```

#### 2) install it manually
1. ```git clone https://github.com/Morsmalleo/AhMyth.git```
2. ```cd AhMyth/AhMyth-Server```
3. ```npm install && npm audit```
#### Use update-alternatives to select and use openJDK 8
4. ```update-alternatives --config java``` - Select the corresponding number for OpenJDK-8-JDK
#### Now you can run AhMyth
5. ```npm start```
6. Input the below code into a `.sh` file to install openjdk-8-jdk from Debian Stretch or download it manually if you are not comfortable with running the below code
`#/bin/sh

# Ensure we are being ran as root
if [ $(id -u) -ne 0 ]; then
        echo "This script must be ran as root"
        exit 1
fi

apt-get install xterm
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
sleep 2`

## Screenshots
<p align="center">
  <img src="http://i.imgur.com/HM3uXL6.png" width="600"/>
</p>

---------------------------------------------------------------

<p align="center">
  <img src="http://i.imgur.com/nHTGGHi.png" width="600"/>
</p>

---------------------------------------------------------------

<p align="center">
  <img src="http://i.imgur.com/XVXCHV9.png" width="600"/>
</p>


---------------------------------------------------------------
##### This is not my work, I have only contributed to this wonderful tool.
