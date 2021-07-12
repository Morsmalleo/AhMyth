# AhMyth Android Rat
### Getting Started
You can install AhMyth in two ways but first make sure you have all the prerequisites listed below

---------------------------------------------------------------------------------------------------
## PREREQUISITES
- npm
- nodejs
- electron (To start the app)
- Java 8 openjdk or Java 11 openjdk (To generate backdoor)
- electron packager (if you want to build binaries for Windows/Mac/Linux)
----------------
### INSTALLATION
----------------
### Kali Installation
#### Auto install
1. ```git clone https://github.com/Morsmalleo/AhMyth.git```
2. ```cd AhMyth/AhMyth-Server```
3. ```chmod +x AhMyth-Kali.sh``` 
4. ```sudo ./AhMyth-Kali.sh```
###### Once the installer file has finished it will prompt you to change your java version
5.  ```Select the corresponding number for OpenJDK-8-JDK``` - Example: `2`

###### Once the installer file has finished installing everything, it will ask you if you want to create a system shortcut to be able to launch AhMyth from anywhere in the terminal or desktop.

- if you chose Yes for system shortcut - type ```ahmyth``` anywhere in your terminal to launch AhMyth
- if you chose No for system shortcut - type ```npm start``` inside the `AhMyth-Server` folder

#### Manual Install
1. ```git clone https://github.com/Morsmalleo/AhMyth.git```
2. ```cd AhMyth/AhMyth-Server```
3. ```npm install && npm audit```

###### Add this line to your sources.list file 
- `deb http://deb.debian.org/debian stretch main contrib non-free` 
###### then comment out any other repo by marking it with a `#` next to where it reads `deb/deb-src`

4. ```sudo apt update && sudo apt install openjdk-8-jdk openjdk-8-jre```
5. ```sudo update-alternatives --config java``` - Select the corresponding number for openjdk-8-jdk `Example: 2`
6. ```npm start```
------------------

### Parrot OS installation
#### Auto install
1. ```git clone https://github.com/Morsmalleo/AhMyth.git```
2. ```cd AhMyth/AhMyth-Server```
3. ```chmod +x AhMyth-Parrot.sh```
4. ```sudo ./AhMyth-Parrot.sh```
###### Once the installer file has finished it will prompt you to change your java version
5.  ```Select the corresponding number for OpenJDK-8-JDK``` - Example: `2`

###### Once the installer file has finished installing everything, it will ask you if you want to create a system shortcut to be able to launch AhMyth from anywhere in the terminal or desktop.

- if you chose Yes for system shortcut - type ```ahmyth``` anywhere in your terminal to launch AhMyth
- if you chose No for system shortcut - type ```npm start``` inside the `AhMyth-Server` folder

#### Manual Install
1. ```git clone https://github.com/Morsmalleo/AhMyth.git```
2. ```cd AhMyth/AhMyth-Server```
3. ```npm install && npm audit```

###### Add this line to your sources.list file 
- `deb http://deb.debian.org/debian stretch main contrib non-free` 
###### then comment out any other repo by marking it with a `#` next to where it reads `deb/deb-src`

4. ```sudo apt update && sudo apt install openjdk-8-jdk openjdk-8-jre```
5. ```sudo update-alternatives --config java``` - Select the corresponding number for openjdk-8-jdk `Example: 2`
6. ```npm start```
------------------

### Debian Installation
#### Auto install
1. ```git clone https://github.com/Morsmalleo/AhMyth.git```
2. ```cd AhMyth/AhMyth-Server```
3. ```chmod +x AhMyth-Debian```
4. ```sudo ./AhMyth-Debian.sh```
###### Once the installer file has finished it will prompt you to change your java version
5.  ```Select the corresponding number for OpenJDK-8-JDK``` - Example: `2`

###### Once the installer file has finished installing everything, it will ask you if you want to create a system shortcut to be able to launch AhMyth from anywhere in the terminal or desktop.

- if you chose Yes for system shortcut - type ```ahmyth``` anywhere in your terminal to launch AhMyth
- if you chose No for system shortcut - type ```npm start``` inside the `AhMyth-Server` folder

#### Manual Install
1. ```git clone https://github.com/Morsmalleo/AhMyth.git```
2. ```cd AhMyth/AhMyth-Server```
3. ```npm install && npm audit```

###### Add this line to your sources.list file 
- `deb http://deb.debian.org/debian stretch main contrib non-free` 
###### then comment out any other repo by marking it with a `#` next to where it reads `deb/deb-src`

4. ```sudo apt update && sudo apt install openjdk-8-jdk openjdk-8-jre```
5. ``` sudo update-alternatives --config java``` - Select the corresponding number for openjdk-8-jdk `Example: 2`
6. ```npm start```

--------------------------------------------------------------------------

### Windows 10 Installation
#### Auto Install
- COMING SOON!

#### Manual Install
#### Prerequisits
- npm & nodejs for Windows 10 - https://nodejs.org/en/download/
- Java 11.0.11 for Windows 10 - https://www.oracle.com/au/java/technologies/javase-jdk11-downloads.html
- Git for Windows 10 - https://git-scm.com/downloads
---------------------------------
1. ```git clone https://github.com/Morsmalleo/AhMyth```
###### Move the AhMyth folder to your Desktop to make everything easier
3. ```cd C:\Users\your-username-here\Desktop\AhMyth\AhMyth-Server```
4. ```npm install && npm audit```
5. ```npm start``` or ```npx electron ./app --no-sandbox start```

--------------------------------------------------------------------------
##### This is not my work, I have only contributed to this wonderful tool.

##### if you have any question in terms of errors or issues with this version of AhMyth please contact me on Twitter
https://twitter.com/Morsmalleo
