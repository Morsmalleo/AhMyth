#! /usr/bin/bash
null="> /dev/null 2>&1"
g="\033[1;32m"
r="\033[1;31m"
b="\033[1;34m"
w="\033[0m"
echo -e $b">"$w" SARA - Simple android ransomware attack"
echo -e $b">"$w" prepare for installing dependencies ..."
sleep 3
echo -e $b">"$w" installing package: "$g"default-jdk"$w
sudo pacman -S default-jdk -y
echo -e $b">"$w" installing package: "$g"aapt"$w
sudo pacman -S aapt zipalign -y
echo -e $b">"$w" installing package: "$g"apktool"$w
sudo pacman -S apktool -y
echo -e $b">"$w" installing package: "$g"imagemagick"$w
sudo pacman -S imagemagick -y
echo -e $b">"$w" installing pacakge: "$g"python3"$w
sudo pacman -S python3 python3-pip -y
echo -e $b">"$w" installing modules: "$g"pillow"$w
pip3 install Pillow
echo -e $b">"$w" successfully installing dependencies"
echo -e $b">"$w" use command "$g"python3 sara.py"$w" for start the console"
