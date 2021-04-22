# AhMyth Android Rat
----------------------
## Getting Started
----------------------
#### Important information - PLEASE READ
-----------------------------------------
The shell scripts titled `AhMyth.sh`, `AhMyth-2.sh` & ` AhMyth-parrot.sh` have been tested on Debian 10, Kali Linux & Parrot OS.
- If you are using Kali Linux or Debian, then just simply run the `AhMyth.sh` script, your **sources.list** file should be located in `/etc/apt/` by defualt on Kali Linux & Debian
- If you are using Parrot OS, then run the **AhMyth-parrot.sh** script, your **parrot.list** file should be located in `/etc/apt/sources.list.d/` by default. Parrot OS does contain a **sources.list** file located in `/etc/apt/` but it is usually empty by default, so the `AhMyth-parrot.sh` script wont touch that file.
- if you are using Debian, or Kali, and your **sources.list** file is located in `/etc/apt/sources.list.d` then run the `AhMyth-2.sh` script
------------------------------------------------------
### You can install AhMyth in two ways
--------------------------------------
#### Prerequisits
- openJDK-8-JDK from Debian Stretch
- electron 
- electron packager (to build binaries for Windows/Mac/Linux)

## Kali & Debian installtion
-----------------------------
### Auto install
1. ```git clone https://github.com/Morsmalleo/AhMyth.git```
2. ```cd AhMyth/AhMyth-Server```
3. ```chmod +x AhMyth.sh```
###### line 50 of the `AhMtyh.sh` file will need to be edited for **Debian users**, just remove where it reads `kali` at the end of line 50 and replace it with your own username 
4. ```sudo ./AhMyth.sh```
###### Once the installer file has finished it will prompt you to change your java version
5.  Select the corresponding number for OpenJDK-8-JDK - `Example: 2`
6. ```npm start```

### Manual Install
1. ```git clone https://github.com/Morsmalleo/AhMyth.git```
2. ```cd AhMyth/AhMyth-Server```
3. ```npm install && npm audit```
###### Add this line to your sources.list file `deb http://deb.debian.org/debian stretch main contrib non-free` and comment out any other repo with a `##
4. ```update-alternatives --config java``` - Select the corresponding number for Java 8
5. ``` cd AhMyth/server && npm start```

## Parrot OS installation
--------------------------
### Auto install
1. ```git clone https://github.com/Morsmalleo/AhMyth.git```
2. ```cd AhMyth/AhMyth-Server```
3. ```npm install && npm audit```
###### line 50 of the `AhMtyh-parrot.sh` file might need to be edited, if your parrot username is not `user` then replace where it reads `user` at the end of line 50 with your own username
4. ```sudo ./AhMyth-parrot.sh```
###### Once the installer file has finished it will prompt you to change your java version
5.  Select the corresponding number for OpenJDK-8-JDK - `Example: 2`
6.```npm start```

### Manual Install
1. ```git clone https://github.com/Morsmalleo/AhMyth.git```
2. ```cd AhMyth/AhMyth-Server```
3. ```npm install && npm audit```
###### Add this line to your parrot.list file `deb http://deb.debian.org/debian stretch main contrib non-free` and comment out any other repo with a `#`
4. ```update-alternatives --config java``` - Select the corresponding number for Java 8
5. ``` cd AhMyth/server && npm start```

## Alternative Debian & Kali Installation
------------------------------------------
If you are using Debian or Kali, and your **sources.list** file is located inside of `/etc/apt/sources.list.d` then
follow these steps

### Auto install
1. ```git clone https://github.com/Morsmalleo/AhMyth.git```
2. ```cd AhMyth/AhMyth-Server```
3. ```npm install && npm audit```
###### line 50 of the `AhMtyh-2.sh` file will need to be edited for **Debian users**, just remove where it reads `kali` at the end of line 50 and replace it with your own username 
4. ```sudo ./AhMyth-2.sh```
###### Once the installer file has finished it will prompt you to change your java version
5.  Select the corresponding number for OpenJDK-8-JDK - `Example: 2`
6.```npm start```

### Manual Install
1. ```git clone https://github.com/Morsmalleo/AhMyth.git```
2. ```cd AhMyth/AhMyth-Server```
3. ```npm install && npm audit```
###### Add this line to your sources.list file `deb http://deb.debian.org/debian stretch main contrib non-free` and comment out any other repo with a `#`
4. ```update-alternatives --config java``` - Select the corresponding number for Java 8
5. ``` cd AhMyth/server && npm start```
--------------------------------------------------------------------------
##### This is not my work, I have only contributed to this wonderful tool.
