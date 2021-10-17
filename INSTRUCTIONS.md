# AhMyth installation instructions
## Prerequisites
    1. nodejs
    - sudo apt -y install nodejs
    
    2. Java 11 Development Kit
    - sudo apt -y install openjdk-11-jdk
    
    (If you want to install openjdk-8-jdk 
    then you'll need to run the autoinstaller)
    
    3. aapt
    - sudo apt -y install aapt
    
    4. android-framework-res
    - sudo apt -y install android-framework-res
## Linux
### Auto Installation
    1. git clone https://github.com/Morsmalleo/AhMyth    
    2. cd AhMyth/AhMyth-Server
    3. chmod +x autoinstall
    4. sudo ./autoinstall
    5. Type the number that corresponds to Java 11 or Java 8 when prompted   
    6. Type `ahmyth` anywhere in the terminal to auto-launch AhMyth
 
 If you have changed your Kali or Parrot username from its default username then you will need to edit `Line 90` of the intaller script you are going to use based on your OS, and insert your own username that you are currently using, for example if your username was `bashful` you would change the username on `Line 90` from `kali` to `bashful`
#
### Manual Installation
    1. git clone https://github.com/Morsmalleo/AhMyth
    2. cd AhMyth/AhMyth-Server
    3. npm install
    4. npm start    
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
