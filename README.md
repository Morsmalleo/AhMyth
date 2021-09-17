<p align="center">

  <img width="700" src="https://user-images.githubusercontent.com/64344168/133610397-bafc580f-2f4b-4bd1-9273-a0216bcaac87.jpg" alt="AhMyth logo">

</p>

#
# Getting Started
### The Application uses two parts:
    The Server side - Control Panel
    The Client side - Backdoor Payload

### Prerequisits:
    npm & nodejs 
    electron (To start the app)
    Java 11 openjdk (To generate backdoor)
    electron packager (if you want to build binaries for Windows/Mac/Linux)
<br /><br />
#
#
# INSTALLATION
## Linux Install
#### Auto install:
    1. git clone https://github.com/Morsmalleo/AhMyth.git
    2. cd AhMyth/AhMyth-Server
    3. chmod +x autoinstall
    4. sudo ./autoinstall
###### Once the "autoinstaller" has finished installing everything, it will prompt you to change your java version
    5. Select the corresponding number for Java 11 openjdk - Example: 0
    6. type `ahmyth` anywhere inside your terminal to auto-launch AhMyth
    7. You can also launch AhMyth from your `Applications Menu`

#### Manual Install:
    1. git clone https://github.com/Morsmalleo/AhMyth.git
    2. cd AhMyth/AhMyth-Server
    3. npm install && npm audit
    4. sudo apt install openjdk-11-jdk openjdk-11-jre
    5. sudo update-alternatives --config java
    6. Select the corresponding number for openjdk-11-jdk - Example: 0
    7. npm start
#
#
## Windows Install
#### Auto Install:
    1. Navigate to the Releases section - https://github.com/Morsmalleo/AhMyth/releases
    2. Click on the latest release version of AhMyth - currently 1.0-beta.3
    3. Click on the AhMyth_Win64-Setup.exe file, or the AhMyth_Win32-Setup.exe file, to download it 
    4. Once downloaded, double click the file and this will begin to install AhMyth for windows automatically
    5. Once AhMyth has been installed, you can start it by double clicking the desktop shortcut 

#### Manual Install:
    INSTALL THE FOLLOWING PREREQUISITS
    - npm & nodejs for Windows 10 - https://nodejs.org/en/download/
    - Java 11 for Windows 10 - https://www.oracle.com/au/java/technologies/javase-jdk11-downloads.html
    - Git for Windows 10 - https://git-scm.com/downloads
###### Open Git Bash and follow the below steps
    1. git clone https://github.com/Morsmalleo/AhMyth
    2. cd C:\Users\your-username-here\Desktop\AhMyth\AhMyth-Server
    3. npm install && npm audit fix
    4. npm start
<br /><br />
# Release Note:
    AhMyth is currently experiencing some problems with APK Binding using Java 8 & 11 on Windows,
    I do not know why this is happening, it didn't happen in my tests otherwise I wouldn't have 
    released v1.0-beta.3, so I will revert back to v1.0-beta.2 or if I have to v1.0-beta.1 and determine
    what the issue is, if found, the issue will be fixed, commited and pushed to github immediately!
    
    For the time being though Windows AhMyth users will have to use Linux instead to run AhMyth until the 
    Windows bug can be fixed, if anyone manages to determine what the problem is before I do, please contact me 
    at morsmalleodev@gmail.com or please create a pull request after testing to make sure the fix works. Please
    note that the Java 11 support is with the followuing files
    - sign.jar
    - testkey.x509.pem
    - testkey.pk8
    
<br /><br />

# Disclaimer
    I am not in any way reponsible for any damage or harm to any devices, you use this at your own risk,
    I also DO NOT OWN THIS PROJECT, I have just contributed to it, this Android RAT application belongs to its 
    creator AhMyth, his github can be found here - https://github.com/AhMyth
---------------------------------------------------------------------------------------------------------------
![splash](https://user-images.githubusercontent.com/64344168/133571994-7595c487-38a5-4c50-845c-597bb12ead94.jpg)


