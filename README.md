# AhMyth Android Rat
### Getting Started
###### The Application uses two parts
- the **`Server`** side - (Attacker)
- the **`Client`** side - (Victim) 

###### You can install AhMyth in 3 ways
1. From Source
2. Manually using **`npm`**
3. Automatically using one of the **`AhMyth-X.sh`** installers

###### Make sure you have all the prerequisites listed below installed before setup
### PREREQUISITES
- npm & nodejs 
- electron (To start the app)
- Java 11 openjdk (To generate backdoor)
- electron packager (if you want to build binaries for Windows/Mac/Linux)
----------------
# INSTALLATION

### Kali Installation
#### Auto install
1. ```git clone https://github.com/Morsmalleo/AhMyth.git```
2. ```cd AhMyth/AhMyth-Server```
3. ```chmod +x AhMyth-Kali.sh```
4. ```sudo ./AhMyth-Kali.sh```
###### Once the installer has installed AhMyth and its prerequisites, it will prompt you to change your java version
5.  ```Select the corresponding number for Java 11 openjdk``` - Example: `0`

###### Once the installer has installed AhMyth and its prerequisites, it will ask if you want to create a `system shortcut` to be able to launch AhMyth from anywhere in the terminal or desktop.
- if you chose Yes for system shortcut - type ```ahmyth``` anywhere in your terminal to launch AhMyth
- if you chose No for system shortcut - type ```npm start``` inside the `AhMyth-Server` folder

#### Manual Install
1. ```git clone https://github.com/Morsmalleo/AhMyth.git```
2. ```cd AhMyth/AhMyth-Server```
3. ```npm install && npm audit```
4. ```sudo apt install openjdk-11-jdk openjdk-11-jre```
5. ```sudo update-alternatives --config java``` 
6. ```Select the corresponding number for openjdk-11-jdk``` - **Example:** **`0`**
7. ```npm start```
------------------

### Parrot OS installation
#### Auto install
1. ```git clone https://github.com/Morsmalleo/AhMyth.git```
2. ```cd AhMyth/AhMyth-Server```
3. ```chmod +x AhMyth-Parrot.sh```
4. ```sudo ./AhMyth-Parrot.sh```
###### Once the installer has installed AhMyth and its prerequisites, it will prompt you to change your java version
5.  ```Select the corresponding number for Java 11 openjdk``` - Example: `0`

###### Once the installer has installed AhMyth and its prerequisites, it will ask you if you want to create a `system shortcut` to be able to launch AhMyth from anywhere in the terminal or desktop.
- if you chose Yes for system shortcut - type ```ahmyth``` anywhere in your terminal to launch AhMyth
- if you chose No for system shortcut - type ```npm start``` inside the `AhMyth-Server` folder

#### Manual Install
1. ```git clone https://github.com/Morsmalleo/AhMyth.git```
2. ```cd AhMyth/AhMyth-Server```
3. ```npm install && npm audit```
4. ```sudo apt install openjdk-11-jdk openjdk-11-jre```
5. ```sudo update-alternatives --config java``` 
6. ```Select the corresponding number for openjdk-11-jdk``` - **Example:** **`0`**
7. ```npm start```
------------------

### Windows 10 Installation
#### Auto Install
- COMING SOON!

#### Manual Install
1. Install npm & nodejs for Windows 10 - **`https://nodejs.org/en/download/`**
2. Install Java 11 for Windows 10 - **`https://www.oracle.com/au/java/technologies/javase-jdk11-downloads.html`**
3. Install Git for Windows 10 - **`https://git-scm.com/downloads`**
###### Right-click on any empty space on the Desktop and select **`Git Bash Here`** then type the following commands below
4. ```git clone https://github.com/Morsmalleo/AhMyth```
5. ```cd C:\Users\your-username-here\Desktop\AhMyth\AhMyth-Server```
6. ```npm install && npm audit```
7. ```npm start``` or ```npx electron ./app --no-sandbox start```

--------------------------------------------------------------------------
##### This is not my work, I have only contributed to this wonderful tool.
