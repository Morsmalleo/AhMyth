# AhMyth Android Rat
----------------------
## Getting Started
----------------------
#### Important information - PLEASE READ
-----------------------------------------
### if your sources.list file is located at /etc/apt/
If your `sources.list` file is located at `/etc/apt/` then just run the `AhMyth.sh` file located at `AhMyth/AhMyth-Server` 

### If your sources.list file is located at /etc/apt/sources.list/
If your `sources.list` file is located at `/etc/apt/sources.list.d/` then edit the `sources.list` file and comment out your original software repo's by marking them all with a `#` next to where it read `deb/deb-src`

### If your sources.list file has a different title/name 
If your `sources.list` file is located at `/etc/apt/` but has a different title/name (`Example: sources.list.buster`) then just rename it to `sources.list`, or move the file to `/etc/apt/sources.list.d` then edit the file and comment out all software repo's by marking them with a `#` next to where it reads `deb/deb-src`

### If this is to much for you
If these steps are to much for you, then you can install AhMyth normally with the following commands
- `cd AhMyth/AhMyth-Server && npm install && npm audit fix`

Then you can install openjdk-8-jdk from the .deb file located at `AhMyth/` with the following commands
- `dpkg -i openjdk-8-jdk.deb`

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
