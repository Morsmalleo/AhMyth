# AhMyth installation instructions
#
## Linux
### Auto Installation | Kali + Parrot OS
    1. git clone https://github.com/Morsmalleo/AhMyth    
    2. cd AhMyth/AhMyth-Server
    3. sudo ./autoinstall
    4. Choose the version of java you want installed - (type 11 or 8)
    5. Select Java 8, or Java 11, when prompted to change to correct java version  
    6. Type `ahmyth` anywhere in the terminal to auto-launch AhMyth
    ------------------------------------------------------------------------------
    The autoinstall script has been coded to install all prerequisits for AhMyth
    including aapt and android-framework-res, the script FINALLY works for both
    Kali and Parrot.
#
### Manual Installation | All Linux platforms
    1. git clone https://github.com/Morsmalleo/AhMyth
    2. cd AhMyth/AhMyth-Server
    3. npm install -g electron@9.4.1
    4. npm start    
#
    If you run into the warning message pictured below, just simply upgrade to node 14.x
![Warning fix](https://user-images.githubusercontent.com/64344168/135712747-8545bc2c-3ef9-4e5e-9890-f2d7f66e1534.png)    

#
# IMPORTANT RELEASE NOTES
## Windows CeaseDev Message
    As of v1.0-beta.3, AhMyth Android RAT is currently no longer being maintained for Windows Machines until 
    further notice, so don't bother trying to post issues or errors related to Windows because they will be 
    ignored and removed.
    
    The setup files for Windows AhMyth, have also been removed due to packaging errors with electron-packager, 
    so don't bother trying to look for them either, and don't bother posting issues related to this, AhMyth's 
    current and previous version are all source code ONLY for the time being! You can Download the source code 
    for AhMyth Windows from the releases section if you wish to test your luck with AhMyth on Windows, but remember 
    Development for Windows AhMyth has ceased until further notice, so DO NOT post errors relating to AhMyth 
    for Windows.
#
## AhMyth_Linux.deb setup packages removed
    As of v1.0-beta.3, The AhMyth_Linux.deb setup files for installing AhMyth for Linux have been removed due to 
    packaging errors with electron-packager, you can still however download the source code from the releases 
    section and follow either the Auto Installation or Manual Installation steps.
