# INSTRUCTIONS
#
## Pre-install Notes | Read before installing
#
## AhMyth Development for Windows Ceased!
    As of v1.0-beta.3, AhMyth Android RAT is no longer being maintained for Windows 
    Machines, so don't bother trying to post issues or errors related to AhMyth for 
    Windows because they will be ignored and removed.
    
#
## Binary Setup Packages (BSP's) removed
    As of v1.0-beta.3, The binary setup files for installing AhMyth for both Linux 
    and Windows have been removed due to packaging errors with electron-packager.
 
    You can still however download the source code from the releases section and 
    follow either the Auto Installation or Manual Installation steps.

#
## Installation
#
## Linux
### Auto Install | Kali + Parrot OS
    1. git clone https://github.com/Morsmalleo/AhMyth    
    2. cd AhMyth/AhMyth-Server
    3. sudo ./autoinstall
    4. Choose the version of java you want installed - (type 11 or 8)
    5. Select Java 8 or Java 11 when prompted to change to the correct java version  
    6. Type `ahmyth` anywhere in the terminal to auto-launch AhMyth
    ------------------------------------------------------------------------------
    The autoinstall script has been coded to install all prerequisits for AhMyth
    including aapt and android-framework-res, the script FINALLY works for both
    Kali and Parrot.
#
### Manual Install | All Linux platforms
    1. git clone https://github.com/Morsmalleo/AhMyth
    2. cd AhMyth/AhMyth-Server
    3. npm install -g electron@9.4.1
    4. npm start    
#
    If you run into the warning message pictured below, just simply upgrade to node 14.x
![Warning fix](https://user-images.githubusercontent.com/64344168/135712747-8545bc2c-3ef9-4e5e-9890-f2d7f66e1534.png)    
