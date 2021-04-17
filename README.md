# AhMyth Android Rat
----------------------
## Getting Started
----------------------
#### Important information - PLEASE READ
-----------------------------------------
The shell scripts titled `AhMyth.sh`, `AhMyth-2.sh` & ` AhMyth-parrot.sh` have been tested on Debian 10, Kali Linux & Parrot OS.
- If you are using Kali Linux or Debian, then just simply run the `AhMyth.sh` script, your **sources.list** file should be located in `/etc/apt/` by defualt on Kali Linux & Debian
- If you are using Parrot OS, then run the **AhMyth-parrot.sh** script, your **parrot.list** file should be located in `/etc/apt/sources.list.d/` by default. Parrot OS does contain a **sources.list** file located in `/etc/apt/` but it is usually empty by default, so the `AhMyth-parrot.sh` script wont touch that file.
- if you are using a Debian, or Kali, and your **sources.list** file is located in `/etc/apt/sources.list.d` then run the `AhMyth-2.sh` script
------------------------------------------------------
### You can install AhMyth in two ways
--------------------------------------
#### Prerequisits
- openJDK-8-JDK from Debian Stretch
- electron 
- electron packager (to build binaries for Windows/Mac/Linux)

#### 1. Install AhMyth + AhMyth dependancies automatically
1. ```git clone https://github.com/Morsmalleo/AhMyth.git```
2. ```cd AhMyth/AhMyth-Server```
3. ```chmod +x AhMyth.sh```
#### Edit line 50 of the `AhMtyh.sh` file where it reads `su -c "npm install && npm audit fix" kali` and replace where it reads `kali` with your linux's username
4. ```sudo ./AhMyth.sh```
#### Once the installer file has finished it will prompt you to change your java version
5.  Select the corresponding number for OpenJDK-8-JDK - `Example: 2`
#### Now you can run AhMyth
6. ```npm start```

#### WARNING: DO NOT EXIT OR STOP THIS SCRIPT WHILE IT IS RUNNING BY ANY MEANS NECESSARY OR YOU WILL LOSE YOUR ORIGINAL `sources.list` FILE

#### 2. install it manually
1. ```git clone https://github.com/Morsmalleo/AhMyth.git```
2. ```cd AhMyth/AhMyth-Server```
3. ```npm install && npm audit```
#### Install openjdk-8-jdk from the .deb file
4. ```sudo dpkg -i openjdk-8-jdk.deb```
#### Use update-alternatives to select and use openJDK 8
5. ```update-alternatives --config java``` - Select the corresponding number for OpenJDK-8-JDK
6. ```npm start```
--------------------------------------------------------------------------
##### This is not my work, I have only contributed to this wonderful tool.
