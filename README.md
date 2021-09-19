<p align="center">

  <img width="700" src="https://user-images.githubusercontent.com/64344168/133610397-bafc580f-2f4b-4bd1-9273-a0216bcaac87.jpg" alt="AhMyth logo">

</p>

## IMPORTANT NOTES PLEASE READ
### AhMyth.deb packages removed
    I have removed all the AhMyth Linux.deb setup files from versions 1.0-beta.2 & 1.0-beta.3
    due to errors with AhMyth after having it packaged into .deb files for 64-Bit & 32-Bit Linux Machines.
<br /><br />
### Windows Development Ceased
    AhMyth development for Windows machines has ceased since v1.0-beta.3, due to to many errors 
    and issues compared to that of Linux. AhMyth will now be developed and maintained for Linux 
    Machines only. This Windows sub-section of the installation section of AhMyth will be removed 
    in the next release of AhMyth Android RAT. 
    
    You will no longer find Windows Setup executables for AhMyth in versions 1.0-beta.2 & 1.0-beta.3, 
    as well as future releases of AhMyth.
<br /><br />
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
# INSTALLATION
## Linux
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
<br /><br />
# Disclaimer
    I am not in any way reponsible for any damage or harm to any devices, you use this at your own risk,
    I also DO NOT OWN THIS PROJECT, I have just contributed to it, this Android RAT application belongs to its 
    creator AhMyth, his github can be found here - https://github.com/AhMyth
---------------------------------------------------------------------------------------------------------------
![splash](https://user-images.githubusercontent.com/64344168/133571994-7595c487-38a5-4c50-845c-597bb12ead94.jpg)


