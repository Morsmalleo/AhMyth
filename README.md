# AhMyth Android Rat
--------------------
## Getting Started
### You can install AhMyth in two ways

#### Important information - PLEASE READ

The `AhMyth.sh` file was written in the sense that the users main software repo list is located inside `etc/apt/sources.list` and not at `/etc/apt/sources.list.d/sources.list`. 
If your main software repo list is indeed locted inside `/etc/apt/sources.list.d/sources.list` or is located at `/etc/apt/` but has a different title `Example: /etc/apt/sources.list.buster`, then you can still run the script, it will just give a few errors because the file its trying to backup (i.e your main software repo list) isn't located in the directory its programmed to operate in or can't find it due to it having a different title, To make it easy so you can avoid problems while installing, you can just name your main software repo `sources.list` if its named anything else, `Example: Sources.list.buster would be renamed sources.list` and place it inside /etc/apt

1. ```git clone https://github.com/Morsmalleo/AhMyth.git```
2. ```cd AhMyth/AhMyth-Server```
3. ```chmod +x AhMyth.sh```
4. ```sudo ./AhMyth.sh```
#### Use update-alternatives to select and use openJDK 8
5. ```update-alternatives --config java``` - Select the corresponding number for OpenJDK-8-JDK
#### Now you can run AhMyth
6. ```npm start```

#### WARNING: DO NOT EXIT OR STOP THIS SCRIPT WHILE IT IS RUNNING BY ANY MEANS NECESSARY OR YOU WILL LOSE YOUR ORIGINAL `sources.list` FILE

#### 2. install it manually
1. ```git clone https://github.com/Morsmalleo/AhMyth.git```
2. ```cd AhMyth/AhMyth-Server```
3. ```npm install && npm audit```
4. ```wget http://security.debian.org/debian-security/pool/updates/main/o/openjdk-8/openjdk-8-jdk_8u275-b01-1~deb9u1_amd64.deb```
5. ```sudo dpkg -i openjdk-8-jdk_8u275-b01-1~deb9u1_amd64.deb```
#### Use update-alternatives to select and use openJDK 8
6. ```update-alternatives --config java``` - Select the corresponding number for OpenJDK-8-JDK
7. ```npm start```
--------------------------------------------------------------------------
##### This is not my work, I have only contributed to this wonderful tool.
